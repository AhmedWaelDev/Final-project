import 'package:bloc/bloc.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit() : super(UpComingInitial());

  Future<void> fetchUpUserAppointments() async {
    emit(fetchUpUserDataLoading());
    try {
      final token = CacheHelper().getData(key: "token");

      final response = await Dio().get(
        '$baseUrl/patient/${CacheHelper().getData(key: "id")}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data["appointments"];
        print(data);
        emit(fetchUpUserDataSuccess(appointments: data));
      } else {
        emit(fetchUpUserDataFailure(error: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(fetchUpUserDataFailure(error: e.toString()));
    }
  }

  Future<void> fetchUpUpcomingAppointments() async {
    emit(fetchUpUpcomingAppointmentsLoading());
    try {
      final token = CacheHelper().getData(key: "token");

      final response = await Dio().get(
        '$baseUrl/patients/${CacheHelper().getData(key: "id")}/appointments/status/2',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data["appointments"];
        emit(fetchUpUpcomingAppointmentsSuccess(appointments: data));
      } else {
        emit(fetchUpUpcomingAppointmentsFailure(error: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(fetchUpUpcomingAppointmentsFailure(error: e.toString()));
    }
  }

  Future<void> fetchUpCompleteAppointments() async {
    emit(fetchUpCompleteAppointmentsLoading());
    try {
      final token = CacheHelper().getData(key: "token");

      final response = await Dio().get(
        '$baseUrl/patients/${CacheHelper().getData(key: "id")}/appointments/status/3',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        List<dynamic> data = response.data["appointments"];
        emit(fetchUpCompleteAppointmentsSuccess(appointments: data));
      } else {
        emit(fetchUpCompleteAppointmentsFailure(error: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(fetchUpCompleteAppointmentsFailure(error: e.toString()));
    }
  }
}
