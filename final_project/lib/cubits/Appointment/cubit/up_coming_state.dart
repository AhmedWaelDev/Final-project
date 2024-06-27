part of 'up_coming_cubit.dart';

@immutable
sealed class UpComingState {}

final class UpComingInitial extends UpComingState {}

final class UpcomingAppointmentsLoading extends UpComingState {}

final class UpcomingAppointmentsLoaded extends UpComingState {
  final List<dynamic> appointments;

  UpcomingAppointmentsLoaded({required this.appointments});
}

final class UpcomingAppointmentsFailure extends UpComingState {
  final String error;

  UpcomingAppointmentsFailure({required this.error});
}
