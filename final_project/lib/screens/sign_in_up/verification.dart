import 'package:final_project/CustomWidgets/logbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../CustomWidgets/backButton.dart';
import '../../CustomWidgets/otpTextForm.dart';
import 'congrats.dart';

class verification extends StatelessWidget {
  const verification({super.key});

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
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      "assets/Logo/GroupLogo.svg",
                      height: size.height * 260 / 932,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 90 / 932,
                  ),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                  Text(
                    "Enter the verification code we just send on your email address",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: const Color(0xff757575),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.normal,
                        fontSize: size.width * 13 / 320),
                  ),
                  SizedBox(
                    height: size.height * 15 / 932,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      otpTextForm(),
                      otpTextForm(),
                      otpTextForm(),
                      otpTextForm(),
                      otpTextForm(),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 20 / 932,
                  ),
                  logbtn(
                    mainColor: mainColor,
                    text: "Verify",
                    onTapFun: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const congrats()),
                      );
                    },
                  ),
                  SizedBox(
                    height: size.height * 10 / 932,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t received code?  ",
                        style: TextStyle(
                            fontFamily: "INTER",
                            fontSize: 16,
                            color: Color(
                              0xff757575,
                            )),
                      ),
                      Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(
                              0xff716ACB,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(alignment: Alignment.topLeft, child: const backBtn()),
          ],
        ),
      ),
    );
  }
}
