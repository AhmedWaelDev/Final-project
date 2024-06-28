import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'get_patient_with_date_state.dart';

class GetPatientWithDateCubit extends Cubit<GetPatientWithDateState> {
  GetPatientWithDateCubit() : super(GetPateintWithDateInitial());

  Future<void> GetPateintWithDate(String date) async {
    emit(GetPateintWithDateLoading());
    try {
      final id = CacheHelper().getData(key: "id");
      final token = CacheHelper().getData(key: "token");

      final response = await Dio().get(
        '$baseUrl/doctor/$id/patients/$date',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );

      final patients = response.data['appointments'] as List<
          dynamic>; // Assuming 'appointments' is the key for the list of patients

      emit(GetPateintWithDateSuccess(patients: patients));
    } on DioException catch (e) {
      print('Error: ${e.response?.statusCode ?? e.message}');
      print('Error: ${e.response?.data ?? e.message}');
      emit(GetPateintWithDateFailure(
        errMessage: e.response?.data.toString() ?? 'An unknown error occurred',
      ));
    }
  }
}
