import 'package:bloc/bloc.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  UpComingCubit() : super(UpComingInitial());

  Future<void> fetchUpComingCubit() async {
    emit(UpcomingAppointmentsLoading());
    try {
      final response = await Dio().get('$baseUrl/appointments');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        emit(UpcomingAppointmentsLoaded(appointments: data));
      } else {
        emit(UpcomingAppointmentsFailure(error: 'Failed to fetch data'));
      }
    } catch (e) {
      emit(UpcomingAppointmentsFailure(error: e.toString()));
    }
  }
}
