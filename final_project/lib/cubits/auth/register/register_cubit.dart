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
    try {
      var formData = {
        'name': RegisterName.text,
        'email': RegisterEmail.text,
        'password': RegisterPassword.text,
        'password_confirmation': RegisterConfirmPassword.text,
        'phone': RegisterPhoneNumber.text,
      };
      var formData2 = {
        "name": "ahmed wael ali",
        "email": "ahm3@gmail.com",
        "password": "123456789",
        "password_confirmation": "123456789",
        "phone": "01002068841"
      };
      var response = await Dio().post(
        'http://127.0.0.1:8000/api/register',
        data: formData2,
      );
      emit(RegisterSuccess());
      if (response.statusCode == 201) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailure(errMessage: "error"));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: e.toString()));
    }
  }
}
