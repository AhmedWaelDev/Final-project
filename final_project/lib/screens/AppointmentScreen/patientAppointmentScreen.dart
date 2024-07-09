import 'package:final_project/cubits/Appointment/up_coming/up_coming_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/AppointmentScreen/getAppointment.dart';
import 'package:final_project/screens/chat/chatScreen.dart';
import 'package:final_project/screens/video/viedoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CustomWidgets/DoctorCard.dart';
import '../../CustomWidgets/cardComplete.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedIndex = 1;
  late UpComingCubit _upcomingCubit;

  @override
  void initState() {
    super.initState();
    _upcomingCubit = UpComingCubit();
    _upcomingCubit
        .fetchUpCompleteAppointments(); // Fetch the upcoming appointments initially
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      _upcomingCubit.fetchUpUserAppointments();
    } else if (index == 1) {
      _upcomingCubit.fetchUpCompleteAppointments();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider<UpComingCubit>.value(
      value: _upcomingCubit,
      child: Scaffold(
        backgroundColor: const Color(0xffe5e9f0),
        appBar: AppBar(
          elevation: 0,
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
                  color: Colors.black,
                ),
              ),
            ),
          ),
          backgroundColor: const Color(0xffe5e9f0),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 35 / 430,
                    right: size.width * 35 / 430,
                    top: size.height * 20 / 932,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  color: _selectedIndex == 0
                                      ? Colors.cyan
                                      : Colors.white,
                                  child: TextButton(
                                    child: Text(
                                      "Upcoming",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 18 / 430,
                                        color: _selectedIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onPressed: () => _onItemTapped(0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  color: _selectedIndex == 1
                                      ? Colors.cyan
                                      : Colors.white,
                                  child: TextButton(
                                    child: Text(
                                      "Complete",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 18 / 430,
                                        color: _selectedIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    onPressed: () => _onItemTapped(1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 32 / 932,
              ),
              if (_selectedIndex == 0)
                BlocBuilder<UpComingCubit, UpComingState>(
                  builder: (context, state) {
                    if (state is fetchUpUserDataLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is fetchUpUserDataSuccess) {
                      return state.appointments
                              .where((appointment) =>
                                  appointment["status"]["original"]["status"] !=
                                  3)
                              .isEmpty
                          ? const Center(
                              child: Text("No upcoming appointments"),
                            )
                          : SizedBox(
                              width: size.width * 360 / 430,
                              child: ListView.builder(
                                itemCount: state.appointments
                                    .where((appointment) =>
                                        appointment["status"]["original"]
                                                ["status"] ==
                                            1 ||
                                        appointment["status"]["original"]
                                                ["status"] ==
                                            2)
                                    .length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var filteredAppointments = state.appointments
                                      .where((appointment) =>
                                          appointment["status"]["original"]
                                                  ["status"] ==
                                              1 ||
                                          appointment["status"]["original"]
                                                  ["status"] ==
                                              2)
                                      .toList();

                                  var doctor =
                                      filteredAppointments[index]["doctor"];
                                  return DoctorCard(
                                    status: filteredAppointments[index]
                                        ["status"]["original"]["status"],
                                    image:
                                        "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                    name: doctor["name"],
                                    rating: doctor["stars"].toString(),
                                    specialty:
                                        specialties[doctor["specialtyId"] - 1],
                                    onChatPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatterScreen(
                                            receiverId: doctor["id"].toString(),
                                            receiverName: doctor[
                                                "name"], // Pass the doctor's name here
                                          ),
                                        ),
                                      );
                                    },
                                    onVideoCallPressed: () {
                                      if (filteredAppointments[index]["status"]
                                              ["original"]["status"] ==
                                          1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const VideoScreen(),
                                          ),
                                        );
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Alert'),
                                              content: Text(
                                                  'you can join after : ${calculateRemainingTime(filteredAppointments[index]["appointmentDate"], convertTimeFormat(filteredAppointments[index]["appointmentTime"]))}'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Close'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                    video: 'Video call',
                                  );
                                },
                              ),
                            );
                    } else if (state is fetchUpUpcomingAppointmentsFailure) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return Center(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              context
                                  .read<UpComingCubit>()
                                  .fetchUpUpcomingAppointments();
                            },
                            child: const Text("try again"),
                          ),
                        ),
                      );
                    }
                  },
                )
              else if (_selectedIndex == 1)
                BlocBuilder<UpComingCubit, UpComingState>(
                  builder: (context, state) {
                    if (state is fetchUpCompleteAppointmentsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is fetchUpCompleteAppointmentsSuccess) {
                      return state.appointments.isEmpty
                          ? const Center(
                              child: Text("No complete Appointments"),
                            )
                          : SizedBox(
                              width: size.width * 360 / 430,
                              child: ListView.builder(
                                itemCount: state.appointments.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var appointment =
                                      state.appointments[index]["doctor"];
                                  return cardComplete(
                                    image:
                                        "http://egyclinic.c1.is/items/image/${appointment["image"]}",
                                    name: appointment["name"],
                                    rating: appointment["stars"].toString(),
                                    specialty: specialties[
                                        appointment["specialtyId"] - 1],
                                    onChatPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatterScreen(
                                            receiverId:
                                                appointment["id"].toString(),
                                            receiverName: appointment[
                                                "name"], // Pass the doctor's name here
                                          ),
                                        ),
                                      );
                                    },
                                    onVideoCallPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GetAppointment(
                                              image:
                                                  "http://egyclinic.c1.is/items/image/${appointment["image"]}",
                                              doctorId: appointment["id"] ?? 0,
                                              price: appointment["price"] ?? 0,
                                              listIndex: index,
                                              spcialityId:
                                                  appointment["specialtyId"] ??
                                                      1,
                                              name:
                                                  "${appointment['name'] ?? 'unKown'}",
                                              experiance:
                                                  appointment['experience'] ??
                                                      0,
                                              patientNumber:
                                                  appointment['p_counter'] ?? 0,
                                              rating: appointment["stars"]
                                                  .toString(),
                                              spciality:
                                                  appointment['appointment'] !=
                                                          null
                                                      ? specialties[appointment[
                                                              'specialtyId'] -
                                                          1]
                                                      : 'Unknown Specialty',
                                              ratingCOunt: appointment[
                                                      "ratings_count"] ??
                                                  0,
                                            ),
                                          ));
                                    },
                                  );
                                },
                              ),
                            );
                    } else if (state is fetchUpUpcomingAppointmentsFailure) {
                      return Center(
                        child: Text(state.error),
                      );
                    } else {
                      return Center(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              context
                                  .read<UpComingCubit>()
                                  .fetchUpCompleteAppointments();
                            },
                            child: const Text("try again"),
                          ),
                        ),
                      );
                    }
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
