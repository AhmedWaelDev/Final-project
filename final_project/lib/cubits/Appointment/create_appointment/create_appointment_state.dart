part of 'create_appointment_cubit.dart';

sealed class CreateAppointmentState extends Equatable {
  const CreateAppointmentState();

  @override
  List<Object> get props => [];
}

final class CreateAppointmentInitial extends CreateAppointmentState {}

final class CreateAppointmentsuccess extends CreateAppointmentState {}

final class CreateAppointmentLoading extends CreateAppointmentState {}

final class CreateAppointmentFailure extends CreateAppointmentState {
  final String errMessage;

  const CreateAppointmentFailure({required this.errMessage});
}
