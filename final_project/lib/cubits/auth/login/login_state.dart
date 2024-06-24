part of 'login_cubit.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

//class LoginSuccess extends LoginState {}
final class LoginSuccess extends LoginState {
  final UserModel user;

  LoginSuccess(this.user);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginSuccess &&
          runtimeType == other.runtimeType &&
          user == other.user;

  @override
  int get hashCode => user.hashCode;
}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;

  LoginFailure({required this.errMessage});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginFailure &&
          runtimeType == other.runtimeType &&
          errMessage == other.errMessage;

  @override
  int get hashCode => errMessage.hashCode;
}

final class getUserDataSuccess extends LoginState {
  final UserModel user;
  getUserDataSuccess({required this.user});
}

final class getUserDataLoading extends LoginState {}

final class getUserDataFailure extends LoginState {
  final String errMessage;

  getUserDataFailure({required this.errMessage});
}

class PasswordObscureToggle extends LoginState {
  final bool obsecureValue;
  PasswordObscureToggle(this.obsecureValue);
}

class CheckboxToggle extends LoginState {
  final bool isChecked;
  CheckboxToggle(this.isChecked);
}
