import 'package:final_project/cubits/doctor/get_all_pateint_for_doctor/get_all_pateint_for_doctor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CustomWidgets/screensappbar.dart';
import '../CustomWidgets/doctorAppointmentContainer.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) =>
            GetAllPateintForDoctorCubit()..GetAllPateintForDoctor(),
        child: BlocListener<GetAllPateintForDoctorCubit,
            GetAllPateintForDoctorState>(
          listener: (context, state) {
            if (state is GetAllPateintForDoctorFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errMessage),
                ),
              );
            }
          },
          child: BlocBuilder<GetAllPateintForDoctorCubit,
              GetAllPateintForDoctorState>(
            builder: (context, state) {
              return Scaffold(
                body: state is GetAllPateintForDoctorLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is GetAllPateintForDoctorsuccess
                        ? Container(
                            padding: EdgeInsets.only(
                                top: size.width * 35 / 320,
                                right: size.width * 10 / 320,
                                left: size.width * 10 / 320),
                            height: size.height,
                            width: size.width,
                            color: const Color(0xffe5e9f0),
                            child: Column(children: [
                              const screensappbar(name: "Patient"),
                              SizedBox(
                                height: size.height * 20 / 932,
                              ),
                              SizedBox(
                                height: size.height * 70 / 932,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Search...',
                                    filled: true,
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          size.height * 25 / 932),
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 40 / 932,
                              ),
                              Expanded(
                                  child: ListView.builder(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                itemCount: state.patients.length,
                                itemBuilder: (context, index) {
                                  return doctorAppointContainer(
                                    name: state.patients[index]["name"],
                                  );
                                },
                              ))
                            ]),
                          )
                        : const Center(
                            child: Text('check your internet'),
                          ),
              );
            },
          ),
        ));
  }
}
