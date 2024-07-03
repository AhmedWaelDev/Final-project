import 'package:final_project/cubits/Appointment/up_coming/up_coming_cubit.dart';
import 'package:final_project/models/Helper.dart';
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      context.read<UpComingCubit>().fetchUpUpcomingAppointments();
    } else if (index == 1) {
      context.read<UpComingCubit>().fetchUpCompleteAppointments();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => UpComingCubit()..fetchUpUpcomingAppointments(),
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
                    color: Colors.black),
              )),
            ),
            backgroundColor: const Color(0xffe5e9f0),
          ),
          body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 35 / 430,
                    right: size.width * 35 / 430,
                    top: size.height * 20 / 932),
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
                  if (state is fetchUpUpcomingAppointmentsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is fetchUpUpcomingAppointmentsSuccess) {
                    return SizedBox(
                      width: size.width * 360 / 430,
                      child: ListView.builder(
                        itemCount: state.appointments.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var doctor = state.appointments[index]["doctor"];
                          return DoctorCard(
                            name: doctor["name"],
                            rating: doctor["stars"].toString(),
                            specialty: specialties[doctor["specialtyId"] - 1],
                            onChatPressed: () {},
                            onVideoCallPressed: () {},
                            video: 'Video call',
                          );
                        },
                      ),
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
                              child: const Text("try again"))),
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
                    return SizedBox(
                      width: size.width * 360 / 430,
                      child: ListView.builder(
                        itemCount: state.appointments.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var appointment = state.appointments[index]["doctor"];
                          return cardComplete(
                              name: appointment["name"],
                              rating: appointment["stars"].toString() ?? "0",
                              specialty:
                                  specialties[appointment["specialtyId"] - 1],
                              onChatPressed: () {},
                              onVideoCallPressed: () {});
                        },
                      ),
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
                              child: const Text("try again"))),
                    );
                  }
                },
              )
          ]))),
    );
  }
}
