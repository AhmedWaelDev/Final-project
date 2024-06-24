import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  TextEditingController paymentCardNumber = TextEditingController();
  TextEditingController paymentCardName = TextEditingController();
  TextEditingController paymentCardDate = TextEditingController();
  TextEditingController paymentCardCvv = TextEditingController();
  int? points;

  void reset() {
    emit(PaymentInitial());
  }

  Future<void> payment() async {
    emit(Paymentloading());
    try {
      final response = await Dio().post(
          "$baseUrl/payments/${CacheHelper().getData(key: "id")}",
          data: {
            "cardNumber": paymentCardNumber.text,
            "cardName": paymentCardName.text,
            "points": points,
            "expireDate": paymentCardDate.text,
            "cvv": paymentCardCvv.text
          },
          options: Options(
            headers: {
              'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
            },
          ));
      print("success");
      emit(PaymentSuccess());
    } on DioException catch (e) {
      emit(PaymentFailure(errMessage: e.response!.data.toString()));
    }
  }
}
