import 'package:final_project/screens/Profile/profile.dart';
import 'package:final_project/screens/homePage/patienthomePage.dart';
import 'package:flutter/material.dart';
import '../AppointmentScreen/doctorAppointment.dart';
import '../AppointmentScreen/patientAppointmentScreen.dart';
import '../chat/chat.dart';
import 'doctorHomePage.dart';

const bool ispatient = false;

class myNavBar extends StatefulWidget {
  const myNavBar({super.key});

  @override
  State<myNavBar> createState() => _myNavBarState();
}

class _myNavBarState extends State<myNavBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Chat(),
    const AppointmentScreen(),
    const Profile(),
    const doctorHomePage(),
    const patienthomePagescreen(),
    const doctorAppointment()
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen =
      ispatient ? const patienthomePagescreen() : const doctorHomePage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageStorage(bucket: bucket, child: currentScreen),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF50B7C5),
        onPressed: () {},
        child: const Icon(
          Icons.add_ic_call,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shadowColor: const Color(0xFF50B7C5),
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: size.height * 10 / 932,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    size.height * 25 / 932,
                  ),
                  topRight: Radius.circular(size.height * 25 / 932))),
          height: size.height * 80 / 932,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: size.width * 40 / 320,
                    onPressed: () {
                      setState(() {
                        currentScreen = ispatient
                            ? const patienthomePagescreen()
                            : const doctorHomePage();
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
                            fontSize: size.height * 15 / 932,
                            color: currentTab == 0
                                ? const Color(0xFF50B7C5)
                                : const Color(0xff757575),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: size.width * 40 / 320,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Chat();
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
                            fontSize: size.height * 15 / 932,
                            color: currentTab == 1
                                ? const Color(0xFF50B7C5)
                                : const Color(0xff757575),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: size.width * 40 / 320,
                    onPressed: () {
                      setState(() {
                        currentScreen = ispatient
                            ? const AppointmentScreen()
                            : const doctorAppointment();
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
                        Flexible(
                          child: Text(
                            "Appointment",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: size.height * 15 / 932,
                              color: currentTab == 2
                                  ? const Color(0xFF50B7C5)
                                  : const Color(0xff757575),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: size.width * 40 / 320,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
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
                        Flexible(
                          child: Text(
                            "Profile",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: size.height * 15 / 932,
                              color: currentTab == 3
                                  ? const Color(0xFF50B7C5)
                                  : const Color(0xff757575),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
