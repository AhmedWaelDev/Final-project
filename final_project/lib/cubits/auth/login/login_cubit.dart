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
        final name = decodedToken["name"].toString();

        CacheHelper().saveData(key: "id", value: id);
        CacheHelper().saveData(key: "token", value: token);
        CacheHelper().saveData(key: "name", value: name); // Save user's name

        emit(LoginSuccess());
      } else {
        emit(LoginFailure(errMessage: 'Invalid response from server'));
      }
    } on DioException catch (e) {
      emit(LoginFailure(errMessage: e.response!.data["error"].toString()));
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
      if (response.statusCode == 200) {
        CacheHelper().saveData(key: "name", value: response.data["name"]);
        CacheHelper().saveData(
            key: "date_of_birth",
            value: (response.data["date_of_birth"] ?? "2002-07-13"));
        CacheHelper().saveData(
            key: "experience", value: (response.data["experience"] ?? "0"));
        CacheHelper()
            .saveData(key: "price", value: response.data["price"] ?? "0");
        CacheHelper().saveData(
            key: "specialtyId", value: (response.data["specialtyId"] ?? "0"));
        CacheHelper().saveData(
            key: "date_of_birth", value: response.data["date_of_birth"]);
        CacheHelper().saveData(
            key: "gender", value: (response.data["gender"] ?? "male"));
        CacheHelper().saveData(
            key: "blood_group", value: (response.data["blood_group"] ?? "A+"));
        CacheHelper()
            .saveData(key: "phone", value: (response.data["phone"] ?? "0"));
        UserModel user = UserModel.fromJson(response.data);
        CacheHelper().saveData(
            key: "name", value: response.data["name"]); // Save user's name
        emit(getUserDataSuccess(user: user));
      } else {
        emit(getUserDataFailure(errMessage: 'Failed to fetch user data'));
      }
    } catch (e) {
      emit(getUserDataFailure(errMessage: e.toString()));
    }
  }
}
