part of 'get_patient_with_date_cubit.dart';

sealed class GetPatientWithDateState extends Equatable {
  const GetPatientWithDateState();

  @override
  List<Object> get props => [];
}

final class GetPateintWithDateInitial extends GetPatientWithDateState {}

final class GetPateintWithDateSuccess extends GetPatientWithDateState {
  final List patients;

  const GetPateintWithDateSuccess({required this.patients});
}

final class GetPateintWithDateLoading extends GetPatientWithDateState {}

final class GetPateintWithDateFailure extends GetPatientWithDateState {
  final String errMessage;

  const GetPateintWithDateFailure({required this.errMessage});
}
