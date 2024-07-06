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

      // Print the response data to understand its structure
      print(response.data);

      // Assuming the patients are inside the 'meta' key
      final List<dynamic> patients = response.data['meta'];

      emit(GetAllPateintForDoctorsuccess(patients: patients));
    } on DioException catch (e) {
      emit(GetAllPateintForDoctorFailure(
        errMessage: e.response?.data.toString() ?? 'An unknown error occurred',
      ));
    } catch (e) {
      emit(GetAllPateintForDoctorFailure(
        errMessage: e.toString(),
      ));
    }
  }
}
