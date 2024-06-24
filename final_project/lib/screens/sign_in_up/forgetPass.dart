import 'package:final_project/screens/sign_in_up/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../CustomWidgets/backButton.dart';
import '../../CustomWidgets/logbtn.dart';
import '../../CustomWidgets/textForm.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(size.width * 15 / 320),
          height: size.height,
          width: size.width,
          color: bgCOlor,
          child: Stack(
            children: [
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                          height: size.height * 0.5,
                          margin: EdgeInsets.symmetric(
                              vertical: size.height * 20 / 932),
                          child: SvgPicture.asset("assets/Logo/GroupLogo.svg",
                              height: size.height * 260 / 932)),
                      Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: size.height * 10 / 932),
                            child: Center(
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 26 / 320),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(size.height * 8 / 932),
                            child: Text(
                              "Don’t worry! It occurs. Please enter the email address linked with your account",
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color(0xff757575),
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.normal,
                                  fontSize: size.width * 13 / 320),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: myTextFrom(
                                hint: "Enter your email", label: "Email"),
                          ),
                          logbtn(
                            mainColor: mainColor,
                            text: 'Send Code',
                            onTapFun: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const verification(
                                          email: "emasad",
                                        )),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  )),
              Container(alignment: Alignment.topLeft, child: const backBtn()),
            ],
          )),
    );
  }
}
