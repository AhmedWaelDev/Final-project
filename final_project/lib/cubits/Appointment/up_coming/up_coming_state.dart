part of 'up_coming_cubit.dart';

@immutable
sealed class UpComingState {}

final class UpComingInitial extends UpComingState {}

final class fetchUpUserDataLoading extends UpComingState {}

final class fetchUpUserDataSuccess extends UpComingState {
  final List<dynamic> appointments;

  fetchUpUserDataSuccess({required this.appointments});
}

final class fetchUpUserDataFailure extends UpComingState {
  final String error;

  fetchUpUserDataFailure({required this.error});
}

final class fetchUpUpcomingAppointmentsLoading extends UpComingState {}

final class fetchUpUpcomingAppointmentsSuccess extends UpComingState {
  final List<dynamic> appointments;

  fetchUpUpcomingAppointmentsSuccess({required this.appointments});
}

final class fetchUpUpcomingAppointmentsFailure extends UpComingState {
  final String error;

  fetchUpUpcomingAppointmentsFailure({required this.error});
}

final class fetchUpCompleteAppointmentsLoading extends UpComingState {}

final class fetchUpCompleteAppointmentsSuccess extends UpComingState {
  final List<dynamic> appointments;

  fetchUpCompleteAppointmentsSuccess({required this.appointments});
}

final class fetchUpCompleteAppointmentsFailure extends UpComingState {
  final String error;

  fetchUpCompleteAppointmentsFailure({required this.error});
}
