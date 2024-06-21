import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> logInFormKey = GlobalKey();

  TextEditingController logInEmail = TextEditingController();

  TextEditingController logInPassword = TextEditingController();

  bool obsecureValue = true;

  toggleobsecure() {
    obsecureValue = !obsecureValue;
    emit(PasswordObscureToggle(obsecureValue));
  }

  bool checkValue = false;
  void toggleCheckbox() {
    checkValue = !checkValue;
    if (checkValue == true) {
      CacheHelper().saveData(key: "rememberMeValue", value: checkValue);
    } else {
      CacheHelper().removeData(key: "rememberMeValue");
    }
    emit(CheckboxToggle(checkValue));
  }

  Future<void> login() async {
    try {
      emit(LoginLoading());
      final response = await Dio().post(
        "$baseUrl$loginEndpoint",
        data: {
          'email': logInEmail.text,
          'password': logInPassword.text,
        },
      );

      if (response.statusCode == 200) {
        String token = response.data["token"];
        final decodedToken = JwtDecoder.decode(token);
        final id = decodedToken["sub"].toString();
        CacheHelper().saveData(key: "id", value: id);

        emit(LoginSuccess());
        print(CacheHelper().getAllData().toString());
      } else {
        emit(LoginFailure(errMessage: 'Invalid response from server'));
      }
    } on DioException catch (e) {
      emit(LoginFailure(errMessage: e.response!.data.toString()));
    }
  }
}
