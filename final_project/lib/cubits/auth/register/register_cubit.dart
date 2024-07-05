import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  // Remove GlobalKey from here
  GlobalKey<FormState> RegisterFormKey = GlobalKey();

  TextEditingController RegisterName = TextEditingController();
  TextEditingController RegisterEmail = TextEditingController();
  TextEditingController RegisterPassword = TextEditingController();
  TextEditingController RegisterConfirmPassword = TextEditingController();
  TextEditingController RegisterPhoneNumber = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  TextEditingController otp5 = TextEditingController();
  TextEditingController otp6 = TextEditingController();

  String getOtpString() {
    return otp1.text +
        otp2.text +
        otp3.text +
        otp4.text +
        otp5.text +
        otp6.text;
  }

  bool obsecureValue = true;
  bool confirmObsecureValue = true;

  void toggleObsecure() {
    obsecureValue = !obsecureValue;
    emit(PasswordObscureToggle(obsecureValue));
  }

  void toggleConfirmObsecure() {
    confirmObsecureValue = !confirmObsecureValue;
    emit(PasswordObscureToggle(confirmObsecureValue));
  }

  Future<void> registerFunction() async {
    emit(RegisterLoading());
    Dio dio = Dio();
    try {
      var response = await dio.post(
        "$baseUrl$signupEndpoint",
        data: FormData.fromMap(
          {
            'name': RegisterName.text,
            'email': RegisterEmail.text,
            'password': RegisterPassword.text,
            'password_confirmation': RegisterConfirmPassword.text,
            'phone': RegisterPhoneNumber.text,
          },
        ),
      );

      if (response.statusCode == 201) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errMessage: response.data.toString()));
      }
    } on DioException catch (e) {
      emit(RegisterFailure(
          errMessage: e.response!.data['error']['email'][0].toString()));
    }
  }

  Future<void> register() async {
    emit(RegisterLoading());
    Dio dio = Dio();
    try {
      var response = await dio.post(
        baseUrl,
        data: {
          'name': RegisterName.text,
          'email': RegisterEmail.text,
          'password': RegisterPassword.text,
          'password_confirmation': RegisterConfirmPassword.text,
          'phone': RegisterPhoneNumber.text,
        },
      );

      if (response.statusCode == 201) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errMessage: response.data.toString()));
      }
    } on DioException catch (e) {
      emit(
          RegisterFailure(errMessage: e.response!.data['error'][0].toString()));
    }
  }

  Future<void> otpFunction(final otpCode, final email) async {
    String otpString = getOtpString();

    emit(otpLoading());
    Dio dio = Dio();
    try {
      var response = await dio.post(
        "$baseUrl/verify-email",
        data: {'email': email, 'otp': otpString},
      );

      emit(otpSuccess());
    } on DioException catch (e) {
      emit(otpFailure(errMessage: e.toString()));
    }
  }
}
