import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'add_schedule_state.dart';

class AddScheduleCubit extends Cubit<AddScheduleState> {
  AddScheduleCubit() : super(AddScheduleInitial());

  void chaneToLoadingState() {
    emit(AddScheduleLoading());
  }

  Future<void> AddSchedule(String startDate, String endDate, String startTime,
      String endTime) async {
    emit(AddScheduleLoading()); // Emit loading state

    try {
      final response = await Dio().post('$baseUrl/schedules',
          data: {
            "doctorId": CacheHelper().getData(key: "id"),
            "start_date": startDate,
            "end_date": endDate,
            "start_time": startTime,
            "end_time": endTime
          },
          options: Options(headers: {
            'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
          }));

      print(response.data["message"]);
      emit(AddScheduleSuccess(message: response.data["message"].toString()));
    } on DioException catch (e) {
      if (e.response!.statusCode == 409) {
        emit(const AddScheduleFailure(errMessage: "already added"));
      }
    }
  }
}
