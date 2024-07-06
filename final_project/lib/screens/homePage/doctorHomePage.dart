import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/chat/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../CustomWidgets/appBar.dart';
import '../../CustomWidgets/doctorAppointmentContainer.dart';
import '../../CustomWidgets/timeLIneListTile.dart';
import '../customers/patient.dart';
import '../AppointmentScreen/doctorAppointment.dart';
import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/cubits/doctor/get_all_pateint_for_doctor/get_all_pateint_for_doctor_cubit.dart';
import 'package:final_project/cubits/doctor/get_patient_with_date/get_patient_with_date_cubit.dart';

class doctorHomePage extends StatelessWidget {
  const doctorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgColor = Color(0xffe5e9f0);
    final DateTime now = DateTime.now();
    final String formated = DateFormat('yyyy-MM-dd').format(now);
    String formatedDate = DateFormat('yyyy-MM-dd').format(now);

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllPateintForDoctorCubit>(
          create: (context) =>
              GetAllPateintForDoctorCubit()..GetAllPateintForDoctor(),
        ),
        BlocProvider(
          create: (context) => LoginCubit()..getUserProfile(),
        ),
        BlocProvider<GetPatientWithDateCubit>(
          create: (context) =>
              GetPatientWithDateCubit()..GetPateintWithDate((formated)),
        ),
      ],
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320,
          ),
          height: size.height,
          width: size.width,
          color: bgColor,
          child: Column(
            children: [
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, loginState) {
                  return myAppBar(
                    name: loginState is getUserDataSuccess
                        ? loginState.user.name
                        : ".......",
                    isDoctor: true,
                    image: 'assets/images/person.png',
                  );
                },
              ),
              SizedBox(height: size.height * 20 / 932),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Appointment",
                            style: TextStyle(
                              fontSize: size.height * 20 / 932,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const doctorAppointment(),
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                fontSize: size.height * 20 / 932,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 15 / 932),
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
                                print(formated);
                                formatedDate =
                                    DateFormat('yyyy-MM-dd').format(date);
                                final getPatientCubit =
                                    context.read<GetPatientWithDateCubit>();
                                getPatientCubit.GetPateintWithDate(
                                    date.toString());
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 35 / 932),
                      SizedBox(
                        height: size.height * 0.35,
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
                                    name: patient["patient"]["name"],
                                    isPast: isBeforeCurrentTime(
                                        patient["appointmentTime"],
                                        formatedDate),
                                    size: size,
                                    isFirst: index == 0,
                                    isLast: index == state.patients.length - 1,
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
                      SizedBox(height: size.height * 10 / 932),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your patients",
                            style: TextStyle(
                              fontSize: size.height * 25 / 932,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Patient(),
                                ),
                              );
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                fontSize: size.height * 20 / 932,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 10 / 320),
                      // Fetch patients for doctor
                      BlocBuilder<GetAllPateintForDoctorCubit,
                          GetAllPateintForDoctorState>(
                        builder: (context, state) {
                          if (state is GetAllPateintForDoctorLoading) {
                            return const CircularProgressIndicator();
                          } else if (state is GetAllPateintForDoctorsuccess) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.patients.length,
                              itemBuilder: (context, index) {
                                final patient = state.patients[index];
                                return doctorAppointContainer(
                                  name: patient["name"],
                                  onChatPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChatterScreen(
                                          receiverId: patient["id"].toString(),
                                          receiverName: patient[
                                              "name"], // Pass the patient's name here
                                        ),
                                      ),
                                    );
                                  },
                                  onvedioPressed: () {},
                                );
                              },
                            );
                          } else if (state is GetAllPateintForDoctorFailure) {
                            return Center(
                              child: Text(state.errMessage),
                            );
                          } else {
                            return Center(
                              child: Text(
                                "no patent for this date",
                                style:
                                    TextStyle(fontSize: size.height * 25 / 932),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
