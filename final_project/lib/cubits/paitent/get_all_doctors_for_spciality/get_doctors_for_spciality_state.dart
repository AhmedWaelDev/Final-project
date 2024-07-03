part of 'get_doctors_for_spciality_cubit.dart';

@immutable
sealed class GetAllDoctorsForSpcialityState {}

final class GetDoctorsForSpcialityInitial
    extends GetAllDoctorsForSpcialityState {}

class GetAllDoctorsForSpcialityLoading extends GetAllDoctorsForSpcialityState {}

class GetAllDoctorsForSpcialitySuccess extends GetAllDoctorsForSpcialityState {
  final List doctors;

  GetAllDoctorsForSpcialitySuccess(this.doctors);
}

class GetAllDoctorsForSpcialityFailure extends GetAllDoctorsForSpcialityState {
  final String message;

  GetAllDoctorsForSpcialityFailure(this.message);
}

class GetOnlineDoctorsForSpcialityLoading
    extends GetAllDoctorsForSpcialityState {}

class GetOnlineDoctorsForSpcialitySuccess
    extends GetAllDoctorsForSpcialityState {
  final List doctors;

  GetOnlineDoctorsForSpcialitySuccess(this.doctors);
}

class GetOnlineDoctorsForSpcialityFailure
    extends GetAllDoctorsForSpcialityState {
  final String message;

  GetOnlineDoctorsForSpcialityFailure(this.message);
}

class GetDoctorsSchedulesLoading extends GetAllDoctorsForSpcialityState {}

class GetDoctorsSchedulesSuccess extends GetAllDoctorsForSpcialityState {
  final List schedule;

  GetDoctorsSchedulesSuccess(this.schedule);
}

class GetDoctorsSchedulesFailure extends GetAllDoctorsForSpcialityState {
  final String message;

  GetDoctorsSchedulesFailure(this.message);
}
