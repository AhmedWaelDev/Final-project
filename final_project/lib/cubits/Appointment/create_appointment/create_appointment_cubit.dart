import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  CreateAppointmentCubit() : super(CreateAppointmentInitial());

  Future<void> CreateAppointment(int patientId, int doctorId, int scheduleId,
      String appointmentDate, String appointmentTime) async {
    try {
      emit(CreateAppointmentLoading());

      final response = await Dio().post('$baseUrl/appointments',
          data: {
            "patientId": patientId,
            "doctorId": doctorId,
            "scheduleId": scheduleId,
            "appointmentDate": appointmentDate,
            "appointmentTime": appointmentTime
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
            },
          ));
      print(response);
      emit(CreateAppointmentsuccess());

      print("success");
    } on DioException catch (e) {
      print("failed with error: ${e.response!.data}");
      emit(CreateAppointmentFailure(
          errMessage: e.response!.data["message"].toString()));
    } catch (e) {
      print("failed with error: $e");
      emit(CreateAppointmentFailure(errMessage: e.toString()));
    }
  }
}
