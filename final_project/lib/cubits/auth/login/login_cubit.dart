import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:final_project/models/userModel.dart';

import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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
        CacheHelper().saveData(key: "token", value: token);
        UserModel user = UserModel.fromJson(response.data);
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure(errMessage: 'Invalid response from server'));
      }
    } on DioException catch (e) {
      emit(LoginFailure(errMessage: e.response!.data["error"].toString()));
    }
  }

  String? nameData;

  void isUserDoctor(String a) async {
    var isDOctorData = a;
    if (a == "1") {
      CacheHelper().saveData(key: "isDoctor", value: true);
    } else {
      CacheHelper().saveData(key: "isDoctor", value: false);
    }
  }

  Future<void> getUserProfile() async {
    try {
      emit(getUserDataLoading());
      final response = await Dio().get(
          '$baseUrl/getUserInfo/${CacheHelper().getData(key: "id")}',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
            },
          ));
      // print(response);
      if (response.statusCode == 200) {
        isUserDoctor(response.data["isDoctor"].toString());
        emit(getUserDataSuccess(user: UserModel.fromJson(response.data)));
      } else {
        emit(getUserDataFailure(errMessage: 'Failed to fetch user data'));
      }
    } catch (e) {
      emit(getUserDataFailure(errMessage: e.toString()));
    }
  }
}
