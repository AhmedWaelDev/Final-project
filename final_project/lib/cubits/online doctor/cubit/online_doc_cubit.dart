import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'online_doc_state.dart';

class OnlineDocCubit extends Cubit<OnlineDocState> {
  OnlineDocCubit() : super(OnlineDocInitial());

  final Dio _dio = Dio();

  void fetchOnlineDoctors(int specialtyId) async {
    emit(OnlineDocLoading());
    try {
      final id = CacheHelper().getData(key: "id");
      final token = CacheHelper().getData(key: "token");
      final response = await _dio.get(
        '$baseUrl/doctors/online',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('fetchOnlineDoctors - Response status: ${response.statusCode}');
      print('fetchOnlineDoctors - Response body: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['doctors'];
        print('fetchOnlineDoctors - Data: $data');
        emit(OnlineDocLoaded(data));
      } else {
        print(
            'fetchOnlineDoctors - Failed to load online doctors: ${response.statusMessage}');
        emit(OnlineDocError(
            'Failed to load online doctors: ${response.statusMessage}'));
      }
    } catch (e) {
      print('fetchOnlineDoctors - Error: $e');
      emit(OnlineDocError(e.toString()));
    }
  }

  void fetchAllDoctors() async {
    emit(OnlineDocLoading());
    try {
      final token = CacheHelper().getData(key: "token");
      final response = await _dio.get(
        '$baseUrl/patients/doctors',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('fetchAllDoctors - Response status: ${response.statusCode}');
      print('fetchAllDoctors - Response body: ${response.data}');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('fetchAllDoctors - Data: $data');
        emit(OnlineDocLoaded(data));
      } else {
        print(
            'fetchAllDoctors - Failed to load all doctors: ${response.statusMessage}');
        emit(OnlineDocError(
            'Failed to load all doctors: ${response.statusMessage}'));
      }
    } catch (e) {
      print('fetchAllDoctors - Error: $e');
      emit(OnlineDocError(e.toString()));
    }
  }
}
