part of 'add_schedule_cubit.dart';

sealed class AddScheduleState extends Equatable {
  const AddScheduleState();

  @override
  List<Object> get props => [];
}

final class AddScheduleInitial extends AddScheduleState {}

final class AddScheduleSuccess extends AddScheduleState {
  final String message;

  const AddScheduleSuccess({required this.message});
}

final class AddScheduleFailure extends AddScheduleState {
  final String errMessage;

  const AddScheduleFailure({required this.errMessage});
}

final class AddScheduleLoading extends AddScheduleState {}
