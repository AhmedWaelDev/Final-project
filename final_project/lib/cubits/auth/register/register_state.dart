part of 'register_cubit.dart';

@immutable
class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure({required this.errMessage});
}

final class otpSuccess extends RegisterState {}

final class otpLoading extends RegisterState {}

final class otpFailure extends RegisterState {
  final String errMessage;

  otpFailure({required this.errMessage});
}

class PasswordObscureToggle extends RegisterState {
  final bool obsecureValue;
  PasswordObscureToggle(this.obsecureValue);
}
