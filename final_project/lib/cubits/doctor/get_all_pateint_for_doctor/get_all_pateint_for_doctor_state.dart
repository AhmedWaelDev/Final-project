part of 'get_all_pateint_for_doctor_cubit.dart';

sealed class GetAllPateintForDoctorState extends Equatable {
  const GetAllPateintForDoctorState();

  @override
  List<Object> get props => [];
}

final class GetAllPateintForDoctorInitial extends GetAllPateintForDoctorState {}

final class GetAllPateintForDoctorsuccess extends GetAllPateintForDoctorState {
  final Map<String, dynamic> patients;

  const GetAllPateintForDoctorsuccess({required this.patients});
}

final class GetAllPateintForDoctorLoading extends GetAllPateintForDoctorState {}

final class GetAllPateintForDoctorFailure extends GetAllPateintForDoctorState {
  final String errMessage;

  const GetAllPateintForDoctorFailure({required this.errMessage});
}
