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

class PasswordObscureToggle extends RegisterState {
  final bool obsecureValue;
  PasswordObscureToggle(this.obsecureValue);
}
