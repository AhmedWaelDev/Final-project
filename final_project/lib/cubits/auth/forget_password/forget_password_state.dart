part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class forgetPasswordInitial extends ForgetPasswordState {}

final class forgetPasswordSuccess extends ForgetPasswordState {}

final class forgetPasswordLoading extends ForgetPasswordState {}

final class forgetPasswordfailure extends ForgetPasswordState {
  final String errMessage;

  forgetPasswordfailure({required this.errMessage});
}

final class otpSuccess extends ForgetPasswordState {}

final class otpLoading extends ForgetPasswordState {}

final class otpFailure extends ForgetPasswordState {
  final String errMessage;

  otpFailure({required this.errMessage});
}

final class resetPassowrdSuccess extends ForgetPasswordState {}

final class resetPassowrdLoading extends ForgetPasswordState {}

final class resetPassowrdFailure extends ForgetPasswordState {
  final String errMessage;

  resetPassowrdFailure({required this.errMessage});
}
