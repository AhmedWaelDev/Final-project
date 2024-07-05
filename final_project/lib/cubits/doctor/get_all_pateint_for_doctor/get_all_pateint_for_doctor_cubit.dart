import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'get_all_pateint_for_doctor_state.dart';

class GetAllPateintForDoctorCubit extends Cubit<GetAllPateintForDoctorState> {
  GetAllPateintForDoctorCubit() : super(GetAllPateintForDoctorInitial());

  Future<void> GetAllPateintForDoctor() async {
    emit(GetAllPateintForDoctorLoading());
    try {
      final id = CacheHelper().getData(key: "id");
      final token = CacheHelper().getData(key: "token");
      final response = await Dio().get(
        '$baseUrl/doctor/$id/patients',
        options: Options(headers: {
          'Authorization': 'Bearer $token',
        }),
      );
      print(response.data["meta"]["0"]);
      emit(GetAllPateintForDoctorsuccess(patients: response.data["meta"]));
    } on DioException catch (e) {
      emit(GetAllPateintForDoctorFailure(
        errMessage: e.response?.data.toString() ?? 'An unknown error occurred',
      ));
    }
  }
}
