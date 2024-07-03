import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:meta/meta.dart';

part 'get_doctors_for_spciality_state.dart';

class GetDoctorsForSpcialityCubit
    extends Cubit<GetAllDoctorsForSpcialityState> {
  GetDoctorsForSpcialityCubit() : super(GetDoctorsForSpcialityInitial());
  final Dio _dio = Dio();

  Future<void> getAllDoctorsForSpciality(int specialtyId) async {
    emit(GetAllDoctorsForSpcialityLoading());
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await _dio.get(
        '$baseUrl/specialties/$specialtyId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['doctors'];
        emit(GetAllDoctorsForSpcialitySuccess(data));
      } else {
        print(
            'fetchOnlineDoctors - Failed to load online doctors: ${response.statusMessage}');
        emit(GetAllDoctorsForSpcialityFailure(
            'Failed to load online doctors: ${response.statusMessage}'));
      }
    } catch (e) {
      print('fetchOnlineDoctors - Error: $e');
      emit(GetAllDoctorsForSpcialityFailure(e.toString()));
    }
  }

  Future<void> getOnlineDoctorsForSpciality(int specialtyId) async {
    emit(GetOnlineDoctorsForSpcialityLoading());
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await _dio.get(
        '$baseUrl/doctors/specialty/$specialtyId/online',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['doctors'];
        emit(GetOnlineDoctorsForSpcialitySuccess(data));
      } else {
        print(
            'fetchOnlineDoctors - Failed to load online doctors: ${response.statusMessage}');
        emit(GetOnlineDoctorsForSpcialityFailure(
            'Failed to load online doctors: ${response.statusMessage}'));
      }
    } catch (e) {
      print('fetchOnlineDoctors - Error: $e');
      emit(GetOnlineDoctorsForSpcialityFailure(e.toString()));
    }
  }

  Future<void> getDoctorSchedule(int doctorId, String date) async {
    emit(GetDoctorsSchedulesLoading());
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await _dio.get(
        '$baseUrl/schedules/$doctorId/$date',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      final List<dynamic> schedules = response.data["schedules"];

      if (response.statusCode == 200) {
        emit(GetDoctorsSchedulesSuccess(schedules));
      } else {
        print(
            'fetchOnlineDoctors - Failed to load online doctors: ${response.statusMessage}');
        emit(GetDoctorsSchedulesFailure(
            'Failed to load online doctors: ${response.statusMessage}'));
      }
    } catch (e) {
      print('fetchOnlineDoctors - Error: $e');
      emit(GetDoctorsSchedulesFailure(e.toString()));
    }
  }
}
