import 'package:final_project/screens/Profile/doctorProfile.dart';
import 'package:final_project/screens/chat/chatDoctor.dart';
import 'package:final_project/screens/chat/chatuUsers.dart';
import 'package:final_project/screens/video/videoHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/screens/Profile/profile.dart';
import 'package:final_project/screens/homePage/patienthomePage.dart';
import '../AppointmentScreen/doctorAppointment.dart';
import '../AppointmentScreen/patientAppointmentScreen.dart';

import 'doctorHomePage.dart';

class myNavBar extends StatefulWidget {
  const myNavBar({Key? key, required this.isDoctor}) : super(key: key);

  final bool isDoctor;

  @override
  State<myNavBar> createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {
  int currentTab = 0;
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    currentScreen = widget.isDoctor
        ? const doctorHomePage()
        : const patienthomePagescreen();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is getUserDataSuccess) {
          // Handle success state if needed
        } else if (state is getUserDataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              body: PageStorage(
                bucket: PageStorageBucket(),
                child: state is getUserDataLoading
                    ? const Center(child: CircularProgressIndicator())
                    : currentScreen,
              ),
              bottomNavigationBar: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 6.0,
                color: Colors.white,
                child: SizedBox(
                  height: size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            minWidth: size.width * 0.125,
                            onPressed: () {
                              setState(() {
                                currentScreen = widget.isDoctor
                                    ? const doctorHomePage()
                                    : const patienthomePagescreen();
                                currentTab = 0;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home_outlined,
                                  color: currentTab == 0
                                      ? const Color(0xFF50B7C5)
                                      : const Color(0xff757575),
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: size.height * 0.016,
                                    color: currentTab == 0
                                        ? const Color(0xFF50B7C5)
                                        : const Color(0xff757575),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: size.width * 0.125,
                            onPressed: () {
                              setState(() {
                                currentScreen = widget.isDoctor
                                    ? const PatientChat()
                                    : const Chat();
                                currentTab = 1;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mail_outline_rounded,
                                  color: currentTab == 1
                                      ? const Color(0xFF50B7C5)
                                      : const Color(0xff757575),
                                ),
                                Text(
                                  "Inbox",
                                  style: TextStyle(
                                    fontSize: size.height * 0.016,
                                    color: currentTab == 1
                                        ? const Color(0xFF50B7C5)
                                        : const Color(0xff757575),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Added an empty container to create space for the central button
                      SizedBox(width: size.width * 0.125),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MaterialButton(
                            minWidth: size.width * 0.125,
                            onPressed: () {
                              setState(() {
                                currentScreen = widget.isDoctor
                                    ? const doctorAppointment()
                                    : const AppointmentScreen();
                                currentTab = 2;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: currentTab == 2
                                      ? const Color(0xFF50B7C5)
                                      : const Color(0xff757575),
                                ),
                                Text(
                                  "Appointment",
                                  style: TextStyle(
                                    fontSize: size.height * 0.016,
                                    color: currentTab == 2
                                        ? const Color(0xFF50B7C5)
                                        : const Color(0xff757575),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: size.width * 0.125,
                            onPressed: () {
                              setState(() {
                                currentScreen = widget.isDoctor
                                    ? const doctorProfile()
                                    : const Profile();
                                currentTab = 3;
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: currentTab == 3
                                      ? const Color(0xFF50B7C5)
                                      : const Color(0xff757575),
                                ),
                                Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: size.height * 0.016,
                                    color: currentTab == 3
                                        ? const Color(0xFF50B7C5)
                                        : const Color(0xff757575),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.05,
              left: (size.width / 2) - (size.width * 0.13),
              child: MaterialButton(
                color: const Color(0xFF50B7C5),
                shape: const CircleBorder(),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => Videohomescreen(
                              isDoctor: widget.isDoctor,
                            )),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: const Icon(
                    Icons.add_ic_call,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
