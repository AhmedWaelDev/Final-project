import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/cubits/update_information/update_information_cubit.dart';
import 'package:final_project/screens/homePage/navBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../CustomWidgets/screensappbar.dart';

class PPersonal extends StatefulWidget {
  const PPersonal({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<PPersonal> {
  DateTime selectedDate = DateTime.now();
  String? newSelectedDate;
  String? finalGender;
  String? finalBirthDate;
  String? finalBloodGroub;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        newSelectedDate = "${picked.toLocal()}".split(' ')[0];
        context.read<UpdateInformationCubit>().birthDate = newSelectedDate!;
        print(newSelectedDate);
        finalBirthDate = newSelectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String? selectedGender;
    String? selectedBloodGroup;

    return Scaffold(
      body: Container(
        color: const Color(0xffe5e9f0),
        padding: EdgeInsets.only(
            top: size.width * 20 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        child: Column(
          children: [
            const screensappbar(name: "Personal Information"),
            SizedBox(height: size.height * 10 / 932),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //First Name
                    SizedBox(height: size.height * 20 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      child: TextFormField(
                        controller: context.read<UpdateInformationCubit>().name,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 10 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "Date of birth",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    Container(
                      height: size.height * 70 / 932,
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () => _selectDate(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(color: Colors.black),
                        ),
                        color: Colors.white,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            newSelectedDate == null
                                ? 'Select Date'
                                : newSelectedDate!,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 15 / 932),

                    Container(
                      decoration: const BoxDecoration(),
                      height: size.height * 70 / 932,
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        hint: const Text(
                          'Pick gender',
                          style: TextStyle(color: Colors.black),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                            finalGender = newValue;
                            context.read<UpdateInformationCubit>().gender =
                                newValue!;
                          });
                        },
                        items: <String>['male', 'female'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: size.height * 15 / 932),
                    Container(
                      decoration: const BoxDecoration(),
                      height: MediaQuery.of(context).size.height * 70 / 932,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 52 / 430,
                        right: MediaQuery.of(context).size.width * 52 / 430,
                        top: MediaQuery.of(context).size.height * 12 / 932,
                      ),
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        value: selectedBloodGroup,
                        hint: const Text(
                          'Pick blood group',
                          style: TextStyle(color: Colors.black),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBloodGroup = newValue;
                            finalBloodGroub = newValue;
                            context.read<UpdateInformationCubit>().bloodGroup =
                                newValue!;
                          });
                        },
                        items: <String>[
                          " A+",
                          "A-",
                          "B+",
                          "B-",
                          "AB+",
                          "AB-",
                          'O+',
                          'O-'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: size.height * 15 / 932),

                    SizedBox(height: size.height * 5 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "Phone number",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      child: TextFormField(
                        controller:
                            context.read<UpdateInformationCubit>().number,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 5 / 932),

                    SizedBox(height: size.height * 20 / 932),
                    SizedBox(
                      height: size.height * 100 / 932,
                    ),
                    BlocListener<UpdateInformationCubit,
                        UpdateInformationState>(
                      listener: (context, state) {
                        if (state is UpdateuserInformationSuccess) {
                          () async {
                            await CacheHelper().saveData(
                                key: "name",
                                value: context
                                    .read<UpdateInformationCubit>()
                                    .name
                                    .text);
                            await CacheHelper().saveData(
                                key: "date_of_birth", value: finalBirthDate);
                            await CacheHelper()
                                .saveData(key: "gender", value: finalGender);
                            await CacheHelper().saveData(
                                key: "blood_group", value: finalBloodGroub);
                            await CacheHelper().saveData(
                                key: "phone",
                                value: context
                                    .read<UpdateInformationCubit>()
                                    .number
                                    .text);
                          };
                          context.read<UpdateInformationCubit>().name.clear();
                          context.read<UpdateInformationCubit>().number.clear();

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("success"),
                            ),
                          );
                          context.read<LoginCubit>().getUserProfile();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => myNavBar(
                                      isDoctor: CacheHelper()
                                          .getData(key: "isDoctorAsBool"),
                                    )),
                            (Route<dynamic> route) => false,
                          );
                        } else if (state is UpdateuserInformationFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<UpdateInformationCubit,
                          UpdateInformationState>(
                        builder: (context, state) {
                          return state is UpdateuserInformationLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: size.height * 30 / 932),
                                  width: size.width * 330 / 430,
                                  height: size.height * 50 / 932,
                                  child: MaterialButton(
                                    onPressed: () {
                                      context
                                          .read<UpdateInformationCubit>()
                                          .UpdateuserInformation();
                                    },
                                    color: const Color(0xff50b7c5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13),
                                    ),
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
