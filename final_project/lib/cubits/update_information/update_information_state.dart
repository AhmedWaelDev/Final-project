part of 'update_information_cubit.dart';

sealed class UpdateInformationState extends Equatable {
  const UpdateInformationState();

  @override
  List<Object> get props => [];
}

final class UpdateInformationInitial extends UpdateInformationState {}

final class UpdateuserInformationSuccess extends UpdateInformationState {}

final class UpdateuserInformationLoading extends UpdateInformationState {}

final class UpdateuserInformationFailure extends UpdateInformationState {
  final String message;

  const UpdateuserInformationFailure(this.message);
}

final class UpdateuserImageSuccess extends UpdateInformationState {}

final class UpdateuserImageLoading extends UpdateInformationState {}

final class UpdateuserImageFailure extends UpdateInformationState {
  final String message;

  const UpdateuserImageFailure(this.message);
}

final class UpdateDoctorInformationSuccess extends UpdateInformationState {}

final class UpdateDoctorInformationLoading extends UpdateInformationState {}

final class UpdateDoctorInformationFailure extends UpdateInformationState {
  final String message;

  const UpdateDoctorInformationFailure(this.message);
}
