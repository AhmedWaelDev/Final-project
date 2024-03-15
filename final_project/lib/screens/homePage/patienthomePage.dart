import 'package:final_project/Doctors/doctor.dart';
import 'package:final_project/screens/AppointmentScreen/AppointmentScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../../CustomWidgets/appBar.dart';
import '../../CustomWidgets/medicalAdvice.dart';
import '../../CustomWidgets/upcomingForPatientContainer.dart';

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
            SizedBox(
              height: size.height * 70 / 932,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(size.height * 25 / 932),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
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
                          Text(
                            "Upcoming appointment",
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: size.height * 22 / 932),
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
                              style: TextStyle(
                                fontFamily: 'Inter',
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
                      "Account",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                    ),
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
