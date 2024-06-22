import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> RegisterFormKey = GlobalKey();

  TextEditingController RegisterName = TextEditingController();
  TextEditingController RegisterEmail = TextEditingController();
  TextEditingController RegisterPassword = TextEditingController();
  TextEditingController RegisterConfirmPassword = TextEditingController();
  TextEditingController RegisterPhoneNumber = TextEditingController();

  bool obsecureValue = true;
  bool confirmObsecureValue = true;

  toggleobsecure() {
    obsecureValue = !obsecureValue;
    emit(PasswordObscureToggle(obsecureValue));
  }

  toggleConfirmobsecure() {
    confirmObsecureValue = !confirmObsecureValue;
    emit(PasswordObscureToggle(confirmObsecureValue));
  }

  Future<void> registerFunction() async {
    emit(RegisterLoading());
    Dio dio = Dio();
    try {
      var url = 'https://food-api-omega.vercel.app/api/v1/user/signup';
      var response = await dio.post(
        url,
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
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
}
