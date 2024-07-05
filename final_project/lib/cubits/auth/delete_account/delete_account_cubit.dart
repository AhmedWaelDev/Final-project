import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit() : super(DeleteAccountInitial());

  Future<void> deleteAccount() async {
    try {
      final Dio dio = Dio();
      final response = await dio.delete(
        '$baseUrl/users/${CacheHelper().getData(key: 'id')}/delete-account',
        options: Options(headers: {
          'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}'
        }),
      );
      if (response.statusCode == 200) {
        emit(DeleteAccountFSuccess());
      } else {
        emit(DeleteAccountFailure(errMessage: response.data['message']));
      }
    } catch (e) {
      emit(DeleteAccountFailure(errMessage: e.toString()));
    }
  }
}
