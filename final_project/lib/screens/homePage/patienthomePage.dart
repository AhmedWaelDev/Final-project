import 'package:final_project/CustomWidgets/DoctorsAppoint.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/cubits/Appointment/up_coming/up_coming_cubit.dart';
import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/cubits/doctor/online%20doctors/cubit/online_doctors_cubit.dart';
import 'package:final_project/models/Helper.dart';
import 'package:final_project/screens/AppointmentScreen/getAppointment.dart';
import 'package:final_project/screens/chat/chatuUsers.dart';
import 'package:final_project/screens/medicine%20reminder/reminder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../CustomWidgets/appBar.dart';
import '../../CustomWidgets/medicalAdvice.dart';
import '../../CustomWidgets/patientPill.dart';
import '../../CustomWidgets/upcomingForPatientContainer.dart';
import '../customers/doctor.dart';
import '../../roomDB/DatabaseHelper.dart';
import '../AppointmentScreen/patientAppointmentScreen.dart';

class patienthomePagescreen extends StatelessWidget {
  const patienthomePagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);

    int selectedSpecialtyIndex = 0;
    // const mainColor = Color(0xFF50B7C5);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnlineDoctorsCubit()
            ..fetchOnlineDoctorsBySpeciality(selectedSpecialtyIndex + 1),
        ),
        BlocProvider(
          create: (context) => LoginCubit()..getUserProfile(),
        ),
        BlocProvider(
          create: (context) => UpComingCubit()..fetchUpUserAppointments(),
        ),
      ],
      child: Scaffold(
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
              BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  return state is getUserDataSuccess
                      ? myAppBar(
                          name: state.user.name,
                          isDoctor: false,
                          image: state.user.image!,
                          api: true,
                        )
                      : const myAppBar(
                          name: ".......",
                          isDoctor: false,
                          image: 'assets/images/default-avatar.jpg',
                          api: false,
                        );
                },
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
                      BlocConsumer<UpComingCubit, UpComingState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return SizedBox(
                            height: size.height *
                                230 /
                                932, // Adjust height as needed
                            width: double.infinity,
                            child: state is fetchUpUserDataLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : state is fetchUpUserDataSuccess
                                    ? state.appointments
                                            .where((appointment) =>
                                                appointment["status"]
                                                    ["original"]["status"] !=
                                                3)
                                            .isEmpty
                                        ? const Center(
                                            child: Text(
                                                "No upcoming appointments"),
                                          )
                                        : Swiper(
                                            axisDirection: AxisDirection.up,
                                            curve: Curves.ease,
                                            layout: SwiperLayout.TINDER,
                                            itemCount: state.appointments
                                                .where((appointment) =>
                                                    appointment["status"]
                                                                ["original"]
                                                            ["status"] ==
                                                        1 ||
                                                    appointment["status"]
                                                                ["original"]
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
                                                      appointment["status"]
                                                                  ["original"]
                                                              ["status"] ==
                                                          1 ||
                                                      appointment["status"]
                                                                  ["original"]
                                                              ["status"] ==
                                                          2)
                                                  .toList(); // Filter to include only appointments with status == 1 or 2
                                              var doctor =
                                                  filteredAppointments[index]
                                                      ["doctor"];
                                              var appointment =
                                                  filteredAppointments[index];
                                              return upcomingForPatientContainer(
                                                image:
                                                    "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                                startDate: appointment[
                                                    "appointmentDate"],
                                                startTime: convertTimeFormat(
                                                    appointment[
                                                        "appointmentTime"]),
                                                doctorName: doctor["name"],
                                                status: appointment["status"]
                                                    ["original"]["status"],
                                              );
                                            },
                                          )
                                    : const Text("failed to fetch data"),
                          );
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
                          future: DatabaseHelper().getMedicinesForDateAndId(
                              DateTime.now(),
                              int.parse(CacheHelper().getData(key: "id"))),
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
                      StatefulBuilder(
                        builder: (context, setState) {
                          return SizedBox(
                              height: size.height * 50 / 932,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: specialties.length,
                                  itemBuilder: (context, index) {
                                    bool isSelected =
                                        selectedSpecialtyIndex == index;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedSpecialtyIndex = index;
                                          context
                                              .read<OnlineDoctorsCubit>()
                                              .fetchOnlineDoctorsBySpeciality(
                                                  index + 1);
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 8.0),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? Colors.cyan
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                            color: isSelected
                                                ? Colors.cyan
                                                : Colors.white,
                                          ),
                                        ),
                                        child: Text(
                                          specialties[index],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    );
                                  }));
                        },
                      ),
                      BlocBuilder<OnlineDoctorsCubit, OnlineDoctorsState>(
                        builder: (context, state) {
                          return state is OnlineDoctorsLoading
                              ? SizedBox(
                                  height: size.height * 250 / 932,
                                  child: const Center(
                                      child: CircularProgressIndicator()))
                              : state is OnlineDoctorsLoaded
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 20 / 932),
                                      height: size.height * 200 / 932,
                                      child: state.doctors.isEmpty
                                          ? Center(
                                              child: Text(
                                                'No Available Doctors',
                                                style: TextStyle(
                                                    color:
                                                        const Color(0xFF50B7C5),
                                                    fontSize:
                                                        size.height * 25 / 932),
                                              ),
                                            )
                                          : ListView.builder(
                                              itemCount: state.doctors.length,
                                              itemBuilder: (context, index) {
                                                final doctor = state
                                                    .doctors[index]["doctor"];
                                                return DoctorsAppoint(
                                                  image:
                                                      "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                                  name: doctor['name'] ??
                                                      'No Name Available',
                                                  onChatPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              GetAppointment(
                                                            image:
                                                                "http://egyclinic.c1.is/items/image/${doctor["image"]}",
                                                            doctorId:
                                                                doctor["id"] ??
                                                                    0,
                                                            price: doctor[
                                                                    "price"] ??
                                                                0,
                                                            listIndex: index,
                                                            name:
                                                                "${doctor['name'] ?? 'unKown'}",
                                                            experiance: doctor[
                                                                    'experience'] ??
                                                                0,
                                                            patientNumber: doctor[
                                                                    'p_counter'] ??
                                                                0,
                                                            rating:
                                                                "${doctor['stars'] ?? 0}",
                                                            spciality: doctor[
                                                                        'specialtyId'] !=
                                                                    null
                                                                ? specialties[
                                                                    doctor[
                                                                        'specialtyId']]
                                                                : 'Unknown Specialty',
                                                            ratingCOunt: doctor[
                                                                    "ratings_count"] ??
                                                                0,
                                                            spcialityId: doctor[
                                                                    "specialtyId"] ??
                                                                1,
                                                          ),
                                                        ));
                                                  },
                                                  rating: "${doctor['stars'] ?? 0}"
                                                      .toString(), // Replace with actual rating data
                                                  specialty: doctor[
                                                              'specialtyId'] !=
                                                          null
                                                      ? specialties[doctor[
                                                              'specialtyId'] -
                                                          1]
                                                      : 'Unknown Specialty',
                                                );
                                              },
                                            ),
                                    )
                                  : state is OnlineDoctorsError
                                      ? Text(state.message)
                                      : const Text("failed");
                        },
                      )
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
