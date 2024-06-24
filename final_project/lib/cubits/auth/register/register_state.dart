part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterFailure extends RegisterState {
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
