import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(forgetPasswordInitial());
  TextEditingController Email = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
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

  Future<void> forgetPassword() async {
    try {
      emit(forgetPasswordLoading());

      final response = await Dio().post(
        '$baseUrl/forgot-password',
        data: {"email": Email.text},
      );

      emit(forgetPasswordSuccess());
      print("success");
    } on DioException catch (e) {
      print("failed with error: $e");
      emit(forgetPasswordfailure(
          errMessage: e.response?.data?.toString() ?? 'Unknown error'));
    }
  }

  Future<void> otpFunction(final email) async {
    String otpString = getOtpString();

    int otpInt;
    otpInt = int.parse(otpString);

    print("Email: ${Email.text}");
    print("OTP int: $otpInt");
    print("type of var: ${otpInt.runtimeType}");

    emit(otpLoading());
    Dio dio = Dio();
    try {
      var response = await dio.post(
        "$baseUrl/validate-otp",
        data: {"email": Email.text, "otp": otpString},
      );

      emit(otpSuccess());
    } catch (e) {
      emit(otpFailure(errMessage: e.toString()));
    }
  }

  Future<void> resetPassowrd() async {
    try {
      emit(resetPassowrdLoading());

      final response = await Dio().post(
        '$baseUrl/reset-password',
        data: {
          "email": Email.text,
          "password": newPassword.text,
          "password_confirmation": confirmPassword.text
        },
      );
      emit(resetPassowrdSuccess());
      print("success");
    } on DioException catch (e) {
      print("failed with error: $e");
      emit(resetPassowrdFailure(
          errMessage: e.response?.data?.toString() ?? 'Unknown error'));
    }
  }
}
