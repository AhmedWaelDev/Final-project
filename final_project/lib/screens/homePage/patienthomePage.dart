import 'package:final_project/medicine%20reminder/reminder.dart';
import 'package:final_project/screens/AppointmentScreen/getAppointment.dart';
import 'package:final_project/screens/chat/chatuUsers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../CustomWidgets/DoctorsAppoint.dart';
import '../../CustomWidgets/appBar.dart';
import '../../CustomWidgets/medicalAdvice.dart';
import '../../CustomWidgets/patientPill.dart';
import '../../CustomWidgets/upcomingForPatientContainer.dart';
import '../../customers/doctor.dart';
import '../../roomDB/DatabaseHelper.dart';
import '../AppointmentScreen/patientAppointmentScreen.dart';

class patienthomePagescreen extends StatelessWidget {
  const patienthomePagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    // const mainColor = Color(0xFF50B7C5);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        color: bgCOlor,
        child: Column(
          children: [
            const myAppBar(
              name: "Jenifer",
              isDoctor: false,
              image: 'assets/images/person.png',
            ),
            SizedBox(
              height: size.height * 20 / 932,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    const midical_advice(),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Upcoming appointment",
                              style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AppointmentScreen()),
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
                    ),
                    Swiper(
                      axisDirection: AxisDirection.up,
                      curve: Curves.ease,
                      layout: SwiperLayout.TINDER,
                      itemCount: 4,
                      itemHeight: size.height * 200 / 932,
                      itemWidth: double.infinity,
                      duration: 300,
                      loop: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const upcomingForPatientContainer();
                      },
                    ),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    Text(
                      "Our services",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 10 / 932,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Doctors()),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/schedule.png",
                                height: size.height * 50 / 932,
                              ),
                              SizedBox(
                                height: size.height * 5 / 932,
                              ),
                              Text(
                                "Book App",
                                style: TextStyle(
                                    color: const Color(0xff757575),
                                    fontSize: size.height * 17 / 932,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const myReminder()),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/Reminder.png",
                                height: size.height * 50 / 932,
                              ),
                              SizedBox(
                                height: size.height * 5 / 932,
                              ),
                              Text(
                                "Add  Medicine Reminder",
                                style: TextStyle(
                                    color: const Color(0xff757575),
                                    fontSize: size.height * 17 / 932,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Chat()),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/chat.png",
                                height: size.height * 50 / 932,
                              ),
                              SizedBox(
                                height: size.height * 5 / 932,
                              ),
                              Text(
                                "chat",
                                style: TextStyle(
                                    fontSize: size.height * 17 / 932,
                                    color: const Color(0xff757575),
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    Text(
                      "Today’s medicine",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 10 / 932,
                    ),
                    SizedBox(
                      height: size.height * 160 / 932,
                      child: FutureBuilder<List<Medicine>>(
                        future: DatabaseHelper()
                            .getMedicinesForDate(DateTime.now()),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(
                                child: Text(
                              'No Medicines today 😁',
                              style: TextStyle(
                                  color: const Color(0xFF50B7C5),
                                  fontSize: size.height * 25 / 932),
                            ));
                          } else {
                            return SizedBox(
                              width: double.infinity,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  Medicine medicine = snapshot.data![index];
                                  return pill(
                                    size: size,
                                    amount: medicine.amount,
                                    breakfast: medicine.breakfast,
                                    dinner: medicine.dinner,
                                    lunch: medicine.lunch,
                                    icon: medicine.type,
                                    name: medicine.name,
                                    capsize: medicine.capsize,
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 10 / 320,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available Doctors",
                          style: TextStyle(
                              fontSize: size.height * 20 / 932,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Doctors()),
                              );
                            },
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(fontSize: size.height * 20 / 932),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 10 / 320,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return DoctorsAppoint(
                          name: "Dr. Nada Matani",
                          onChatPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GetAppointment()),
                            );
                          },
                          onVideoCallPressed: () {},
                          rating: 5,
                          specialty: "Pediatricain",
                        );
                      },
                    )
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
