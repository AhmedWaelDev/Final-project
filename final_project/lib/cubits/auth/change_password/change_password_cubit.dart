import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:flutter/material.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<void> changePassword() async {
    try {
      emit(ChangePasswordLoading());

      final response = await Dio().post('$baseUrl/users/change-password',
          data: {
            "current_password": currentPassword.text,
            "new_password": newPassword.text,
            "new_password_confirmation": confirmPassword.text
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
            },
          ));
      print(response);

      emit(ChangePasswordSuccess());
      print("success");
    } catch (e) {
      print("failed with error: $e");
      emit(ChangePasswordFailure(errMessage: e.toString()));
    }
  }
}
