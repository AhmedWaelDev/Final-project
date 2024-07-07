import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:final_project/cubits/doctor/get_all_pateint_for_doctor/get_all_pateint_for_doctor_cubit.dart';
import 'package:final_project/cubits/doctor/get_patient_with_date/get_patient_with_date_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../CustomWidgets/timeLIneListTile.dart';

class doctorAppointment extends StatelessWidget {
  const doctorAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    final DateTime now = DateTime.now();
    final String formated = DateFormat('yyyy-MM-dd').format(now);
    String formatedDate = DateFormat('yyyy-MM-dd').format(now);
    return BlocProvider(
      create: (context) =>
          GetPatientWithDateCubit()..GetPateintWithDate((formated)),
      child:
          BlocBuilder<GetAllPateintForDoctorCubit, GetAllPateintForDoctorState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: EdgeInsets.only(
                  top: size.width * 20 / 320,
                ),
                child: const Center(
                    child: Text(
                  "Appointment",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
              ),
              backgroundColor: bgCOlor,
            ),
            body: state is GetAllPateintForDoctorLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: EdgeInsets.only(
                        top: size.width * 35 / 320,
                        right: size.width * 10 / 320,
                        left: size.width * 10 / 320),
                    height: size.height,
                    width: size.width,
                    color: bgCOlor,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.15,
                          child: BlocBuilder<GetPatientWithDateCubit,
                              GetPatientWithDateState>(
                            builder: (context, state) {
                              return DatePicker(
                                DateTime.now(),
                                height: size.height * 100 / 932,
                                width: size.width * 60 / 320,
                                initialSelectedDate: DateTime.now(),
                                daysCount: 10,
                                dayTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                selectionColor: const Color(0xFF50B7C5),
                                onDateChange: (date) {
                                  formatedDate =
                                      DateFormat('yyyy-MM-dd').format(date);
                                  print(formated);
                                  final getPatientCubit =
                                      context.read<GetPatientWithDateCubit>();
                                  getPatientCubit.GetPateintWithDate(
                                      date.toString());
                                },
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: BlocBuilder<GetPatientWithDateCubit,
                              GetPatientWithDateState>(
                            builder: (context, state) {
                              if (state is GetPateintWithDateLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (state is GetPateintWithDateSuccess) {
                                return ListView.builder(
                                  itemCount: state.patients.length,
                                  itemBuilder: (context, index) {
                                    final patient = state.patients[index];
                                    return doctorTimeLineTile(
                                      image:
                                          "http://egyclinic.c1.is/items/image/${patient["patient"]["image"]}",
                                      name: patient["patient"]["name"],
                                      isPast: isBeforeCurrentTime(
                                          patient["appointmentTime"],
                                          formatedDate),
                                      size: size,
                                      isFirst: index == 0,
                                      isLast:
                                          index == state.patients.length - 1,
                                      startTIme: convertTimeFormat(
                                          patient["appointmentTime"]),
                                      age: patient["patient"]["date_of_birth"],
                                    );
                                  },
                                );
                              } else if (state is GetPateintWithDateFailure) {
                                return Center(
                                  child: Text(state.errMessage),
                                );
                              } else {
                                return Center(
                                  child: Text(
                                    "No patients for this date",
                                    style: TextStyle(
                                        fontSize: size.height * 25 / 932),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
