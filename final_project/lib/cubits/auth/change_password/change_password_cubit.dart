import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  bool obsecureValue = true;
  toggleobsecure() {
    obsecureValue = !obsecureValue;
    emit(PasswordObscureToggle(obsecureValue));
  }

  Future<void> getUserProfile() async {
    try {
      emit(ChangePasswordLoading());
      final response = await Dio().get('$baseUrl/users/change-password',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
            },
          ));
      emit(ChangePasswordSuccess());
    } catch (e) {
      emit(ChangePasswordFailure(errMessage: e.toString()));
    }
  }
}
