part of 'login_cubit.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
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
