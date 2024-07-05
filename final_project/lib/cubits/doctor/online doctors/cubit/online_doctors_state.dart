part of 'online_doctors_cubit.dart';

sealed class OnlineDoctorsState extends Equatable {
  const OnlineDoctorsState();

  @override
  List<Object> get props => [];
}

final class OnlineDoctorsInitial extends OnlineDoctorsState {}

class OnlineDoctorsLoading extends OnlineDoctorsState {}

class OnlineDoctorsLoaded extends OnlineDoctorsState {
  final List doctors;

  const OnlineDoctorsLoaded(this.doctors);
}

class OnlineDoctorsError extends OnlineDoctorsState {
  final String message;

  const OnlineDoctorsError(this.message);
}
