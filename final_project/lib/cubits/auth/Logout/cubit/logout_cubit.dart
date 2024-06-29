import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    try {
      emit(LogoutLoading());
      final response = await Dio().post(
        '$baseUrl/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
          },
        ),
      );

      if (response.statusCode == 200) {
        CacheHelper()
            .removeData(key: "token"); // Remove token from local storage
        emit(LogoutSuccess());
      } else {
        emit(LogoutFailure(errorMessage: 'Failed to logout'));
      }
    } catch (e) {
      emit(LogoutFailure(errorMessage: e.toString()));
    }
  }
}
