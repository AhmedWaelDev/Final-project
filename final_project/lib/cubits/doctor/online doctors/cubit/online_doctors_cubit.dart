import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'online_doctors_state.dart';

class OnlineDoctorsCubit extends Cubit<OnlineDoctorsState> {
  OnlineDoctorsCubit() : super(OnlineDoctorsInitial());
  void fetchOnlineDoctorsBySpeciality(int specialtyId) async {
    emit(OnlineDoctorsLoading());
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await Dio().get(
        '$baseUrl/doctors/specialty/$specialtyId/online',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['doctors'];
        emit(OnlineDoctorsLoaded(data));
      } else {
        print(
            'fetchOnlineDoctors - Failed to load online doctors: ${response.statusMessage}');
        emit(OnlineDoctorsError(
            'Failed to load online doctors: ${response.statusMessage}'));
      }
    } catch (e) {
      print('fetchOnlineDoctors - Error: $e');
      emit(OnlineDoctorsError(e.toString()));
    }
  }
}
