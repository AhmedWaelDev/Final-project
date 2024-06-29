part of 'change_password_cubit.dart';

sealed class ChangePasswordState extends Equatable {
  const ChangePasswordState();

  @override
  List<Object> get props => [];
}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordSuccess extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordFailure extends ChangePasswordState {
  final String errMessage;

  const ChangePasswordFailure({required this.errMessage});
}

class PasswordObscureToggle extends ChangePasswordState {
  final bool obsecureValue;
  const PasswordObscureToggle(this.obsecureValue);
}
