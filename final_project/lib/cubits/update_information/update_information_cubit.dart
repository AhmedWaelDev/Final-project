import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/endPoints.dart';
import 'package:final_project/models/Helper.dart';
import 'package:flutter/material.dart';

part 'update_information_state.dart';

class UpdateInformationCubit extends Cubit<UpdateInformationState> {
  UpdateInformationCubit() : super(UpdateInformationInitial());

  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController experience = TextEditingController();
  String birthDate = "";
  String bloodGroup = "";
  String gender = "";
  String speciality = "";
  var finalSpecialtyId;

  Future<void> UpdateuserInformation() async {
    String finalName =
        name.text.isEmpty ? CacheHelper().getData(key: "name") : name.text;
    String finalNumber = number.text.isEmpty
        ? (CacheHelper().getData(key: "phone") ?? "0")
        : number.text;
    String finalBirthDate = birthDate == ""
        ? CacheHelper().getData(key: "date_of_birth")
        : birthDate;
    String finalBloodGroup = bloodGroup == ""
        ? (CacheHelper().getData(key: "blood_group") ?? "A+")
        : bloodGroup;
    String finalGender = gender == ""
        ? (CacheHelper().getData(key: "gender") ?? "male")
        : gender;

    try {
      emit(UpdateuserInformationLoading());

      final formData = FormData.fromMap({
        "name": finalName,
        "phone": finalNumber,
        "date_of_birth": finalBirthDate,
        "blood_group": finalBloodGroup,
        "gender": finalGender
      });

      final response = await Dio().post(
        '$baseUrl/users/updateInfo/${CacheHelper().getData(key: "id")}',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
          },
        ),
      );

      emit(UpdateuserInformationSuccess());

      print("success");
    } on DioException catch (e) {
      print("failed with error: ${e.response?.data}");
      emit(UpdateuserInformationFailure(
          e.response?.data["message"] ?? "Unknown error"));
    } catch (e) {
      print("failed with error: $e");
      emit(UpdateuserInformationFailure(e.toString()));
    }
  }

  Future<void> UpdatedoctorInformation() async {
    if (speciality == "") {
      finalSpecialtyId = (CacheHelper().getData(key: "name") ?? 0);
    } else {
      finalSpecialtyId = getIndexOfString(specialties, speciality) + 1;
    }
    print("specialityID : $finalSpecialtyId");
    String finalName =
        name.text.isEmpty ? CacheHelper().getData(key: "name") : name.text;
    String finalprice =
        price.text.isEmpty ? CacheHelper().getData(key: "price") : price.text;
    String finalExperience = experience.text.isEmpty
        ? CacheHelper().getData(key: "experience")
        : experience.text;
    String finalNumber =
        number.text.isEmpty ? CacheHelper().getData(key: "phone") : number.text;
    String finalBirthDate = birthDate == ""
        ? CacheHelper().getData(key: "date_of_birth")
        : birthDate;
    String finalBloodGroup = bloodGroup == ""
        ? CacheHelper().getData(key: "blood_group")
        : bloodGroup;
    String finalGender =
        gender == "" ? CacheHelper().getData(key: "gender") : gender;

    try {
      emit(UpdateDoctorInformationLoading());

      final formData = FormData.fromMap({
        "name": finalName,
        "phone": finalNumber,
        "date_of_birth": finalBirthDate,
        "blood_group": finalBloodGroup,
        "gender": finalGender,
        "price": finalprice,
        "experience": finalExperience,
        "specialtyId": finalSpecialtyId,
      });

      final response = await Dio().post(
        '$baseUrl/users/updateInfo/${CacheHelper().getData(key: "id")}',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
          },
        ),
      );

      emit(UpdateDoctorInformationSuccess());

      print("success");
    } on DioException catch (e) {
      print("failed with error: ${e.response?.data}");
      emit(UpdateDoctorInformationFailure(
          e.response?.data["message"] ?? "Unknown error"));
    } catch (e) {
      print("failed with error: $e");
      emit(UpdateDoctorInformationFailure(e.toString()));
    }
  }
}
