part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
}

class PasswordObscureToggle extends LoginState {
  final bool obsecureValue;
  PasswordObscureToggle(this.obsecureValue);
}

class CheckboxToggle extends LoginState {
  final bool isChecked;
  CheckboxToggle(this.isChecked);
}
