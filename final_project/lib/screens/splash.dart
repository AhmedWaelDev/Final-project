import 'dart:async';

import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/screens/homePage/navBar.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'onBoardingPage/onbording_screen.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    bool isVisited = CacheHelper().getData(key: "isVisited") ?? false;
    if (isVisited == true) {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => myNavBar(
                    isDoctor: CacheHelper().getData(key: "isDoctorAsBool"),
                  )),
        );
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const logIn()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF8CE7E7), Color(0xFF50B7C5)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/Logo/Logo.svg', // Replace 'your_logo.svg' with your SVG file
                  // Adjust size as needed
                  height: size.height * 200 / 932,
                ),
                Padding(
                  padding: EdgeInsets.all(size.height * 20 / 932),
                  child: Text(
                    "EClinic",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.height * 50 / 932,
                        fontWeight: FontWeight.w800),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
