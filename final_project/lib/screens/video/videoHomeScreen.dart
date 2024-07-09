import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:final_project/CustomWidgets/timeLIneListTile.dart';
import 'package:final_project/CustomWidgets/upcomingForPatientContainer.dart';
import 'package:final_project/cubits/Appointment/up_coming/up_coming_cubit.dart';
import 'package:final_project/cubits/doctor/get_patient_with_date/get_patient_with_date_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/video/viedoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:intl/intl.dart';

final DateTime now = DateTime.now();
String formatedDate = DateFormat('yyyy-MM-dd').format(now);

class Videohomescreen extends StatelessWidget {
  const Videohomescreen({super.key, required this.isDoctor});
  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPatientWithDateCubit>(
          create: (context) =>
              GetPatientWithDateCubit()..GetPateintWithDate((formatedDate)),
        ),
        BlocProvider(
          create: (context) => UpComingCubit()..fetchUpUserAppointments(),
        ),
      ],
      child: Scaffold(
        body: isDoctor == true ? _doctorVideo(size) : _patientVideo(size),
      ),
    );
  }
}

Widget _patientVideo(size) {
  return Container(
    color: const Color(0xffe5e9f0),
    padding: EdgeInsets.only(
        top: size.width * 20 / 320,
        right: size.width * 10 / 320,
        left: size.width * 10 / 320),
    height: size.height,
    width: size.width,
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const screensappbar(name: "Video call"),
          BlocConsumer<UpComingCubit, UpComingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return SizedBox(
                height: size.height, // Adjust height as needed
                width: double.infinity,
                child: state is fetchUpUserDataLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : state is fetchUpUserDataSuccess
                        ? state.appointments
                                .where((appointment) =>
                                    appointment["status"]["original"]
                                        ["status"] !=
                                    3)
                                .isEmpty
                            ? const Center(
                                child: Text("No upcoming appointments"),
                              )
                            : Center(
                                child: Swiper(
                                  axisDirection: AxisDirection.up,
                                  curve: Curves.ease,
                                  layout: SwiperLayout.TINDER,
                                  itemCount: state.appointments
                                      .where((appointment) =>
                                          appointment["status"]["original"]
                                                  ["status"] ==
                                              1 ||
                                          appointment["status"]["original"]
                                                  ["status"] ==
                                              2)
                                      .length, // Filter to include only appointments with status == 1 or 2
                                  itemHeight: size.height * 200 / 932,
                                  itemWidth: double.infinity,
                                  duration: 300,
                                  loop: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    var filteredAppointments = state
                                        .appointments
                                        .where((appointment) =>
                                            appointment["status"]["original"]
                                                    ["status"] ==
                                                1 ||
                                            appointment["status"]["original"]
                                                    ["status"] ==
                                                2)
                                        .toList(); // Filter to include only appointments with status == 1 or 2
                                    var doctor =
                                        filteredAppointments[index]["doctor"];
                                    var appointment =
                                        filteredAppointments[index];
                                    return upcomingForPatientContainer(
                                      image:
                                          "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                      startDate: appointment["appointmentDate"],
                                      startTime: convertTimeFormat(
                                          appointment["appointmentTime"]),
                                      doctorName: doctor["name"],
                                      status: appointment["status"]["original"]
                                          ["status"],
                                    );
                                  },
                                ),
                              )
                        : const Text("failed to fetch data"),
              );
            },
          ),
        ],
      ),
    ),
  );
}

// Function to check if appointment time is after current time
bool isAppointmentAfterNow(String appointmentTime) {
  // Combine with today's date to create a full DateTime object
  DateTime appointmentDateTime =
      DateTime.parse('$formatedDate $appointmentTime');
  return appointmentDateTime.isAfter(DateTime.now());
}

// Adjusted code in _doctorVideo Widget

Widget _doctorVideo(size) {
  return Container(
    color: const Color(0xffe5e9f0),
    padding: EdgeInsets.only(
      top: size.width * 20 / 320,
      right: size.width * 10 / 320,
      left: size.width * 10 / 320,
    ),
    height: size.height,
    width: size.width,
    child: SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const screensappbar(name: "Video call"),
          SizedBox(
            height: size.height * 50 / 932,
          ),
          SizedBox(
            height: size.height * 0.6,
            child:
                BlocBuilder<GetPatientWithDateCubit, GetPatientWithDateState>(
              builder: (context, state) {
                if (state is GetPateintWithDateLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetPateintWithDateSuccess) {
                  return ListView.builder(
                    itemCount: state.patients.length,
                    itemBuilder: (context, index) {
                      final patient = state.patients[index];
                      bool isAfterNow =
                          isAppointmentAfterNow(patient["appointmentTime"]);
                      return Container(
                        height: size.height * 180 / 932,
                        margin: EdgeInsets.all(size.width * 10 / 320),
                        padding: EdgeInsets.all(size.width * 20 / 320),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: size.height * 50 / 932,
                                    width: size.height * 50 / 932,
                                    child: ClipOval(
                                      child: Image.network(
                                        "http://egyclinic.c1.is/items/image/${patient["patient"]["image"]}",
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/default-avatar.jpg',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 10 / 320,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 80 / 320,
                                        child: Text(
                                          patient["patient"]["name"] ??
                                              "unknown",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: size.height * 20 / 932,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        convertTimeFormat(
                                                patient["appointmentTime"]) ??
                                            "unknown",
                                        style: TextStyle(
                                          fontSize: size.height * 20 / 932,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * 15 / 932,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: size.height * 15 / 932,
                                    width: size.height * 15 / 932,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isAfterNow
                                            ? const Color(0xff757575)
                                            : Colors.green),
                                  ),
                                  SizedBox(
                                    width: size.height * 10 / 932,
                                  ),
                                  Expanded(
                                    child: Text(
                                      isAfterNow
                                          ? calculateRemainingTime(
                                              formatedDate,
                                              convertTimeFormat(
                                                  patient["appointmentTime"]))
                                          : "video call available",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: size.height * 15 / 932,
                                        color: const Color(0xff757575),
                                      ),
                                    ),
                                  ),
                                  isAfterNow
                                      ? Container()
                                      : Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const VideoScreen(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: size.width * 100 / 320,
                                              height: size.height * 50 / 932,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF50B7C5),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      size.height * 25 / 932),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .video_camera_front_rounded,
                                                    color: Colors.white,
                                                  ),
                                                  Text(
                                                    "Join Call",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size.height *
                                                          15 /
                                                          932,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
                      style: TextStyle(fontSize: size.height * 25 / 932),
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
}
