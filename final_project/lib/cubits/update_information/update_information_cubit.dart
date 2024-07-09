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
            .toString() // Ensure finalNumber is a string
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

  Future<void> UpdateuserImage(FileImage image) async {
    try {
      emit(UpdateuserImageLoading());

      // Convert FileImage to MultipartFile
      final multipartFile =
          await MultipartFile.fromFile(image.file.path, filename: 'upload.jpg');

      final formData = FormData.fromMap({"image": multipartFile});

      final response = await Dio().post(
        '$baseUrl/users/updateInfo/${CacheHelper().getData(key: "id")}',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${CacheHelper().getData(key: "token")}',
          },
        ),
      );

      emit(UpdateuserImageSuccess());

      print("success");
    } on DioException catch (e) {
      print("failed with error: ${e.response?.data}");
      emit(UpdateuserImageFailure(
          e.response?.data["message"] ?? "Unknown error"));
    } catch (e) {
      print("failed with error: $e");
      emit(UpdateuserImageFailure(e.toString()));
    }
  }

  Future<void> UpdatedoctorInformation() async {
    if (speciality == "") {
      finalSpecialtyId =
          (CacheHelper().getData(key: "specialtyId") ?? "0").toString();
    } else {
      finalSpecialtyId =
          (getIndexOfString(specialties, speciality) + 1).toString();
    }
    print("specialityID : $finalSpecialtyId");

    String finalName =
        name.text.isEmpty ? CacheHelper().getData(key: "name") : name.text;

    var cachePrice = CacheHelper().getData(key: "price");
    print("Cache price type: ${cachePrice.runtimeType}");
    String finalprice = price.text.isEmpty
        ? cachePrice.toString()
        : price.text; // Ensure finalprice is a string

    var cacheExperience = CacheHelper().getData(key: "experience");
    print("Cache experience type: ${cacheExperience.runtimeType}");
    String finalExperience = experience.text.isEmpty
        ? cacheExperience.toString()
        : experience.text; // Ensure finalExperience is a string

    var cachePhone = CacheHelper().getData(key: "phone");
    print("Cache phone type: ${cachePhone.runtimeType}");
    String finalNumber = number.text.isEmpty
        ? cachePhone.toString()
        : number.text; // Ensure finalNumber is a string

    var cacheBirthDate = CacheHelper().getData(key: "date_of_birth");
    print("Cache date_of_birth type: ${cacheBirthDate.runtimeType}");
    String finalBirthDate = birthDate.isEmpty ? cacheBirthDate : birthDate;

    var cacheBloodGroup = CacheHelper().getData(key: "blood_group");
    print("Cache blood_group type: ${cacheBloodGroup.runtimeType}");
    String finalBloodGroup = bloodGroup.isEmpty
        ? cacheBloodGroup.toString()
        : bloodGroup; // Ensure finalBloodGroup is a string

    var cacheGender = CacheHelper().getData(key: "gender");
    print("Cache gender type: ${cacheGender.runtimeType}");
    String finalGender = gender.isEmpty
        ? cacheGender.toString()
        : gender; // Ensure finalGender is a string

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
      print('Invalid price value: ${price.text}');
      print(
          'Invalid cache price value: ${CacheHelper().getData(key: "price")}');
      print("failed with error: $e");
      emit(UpdateDoctorInformationFailure(e.toString()));
    }
  }
}
