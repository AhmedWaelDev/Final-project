import 'package:final_project/CustomWidgets/logbtn.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../CustomWidgets/backButton.dart';

class congrats extends StatelessWidget {
  const congrats({super.key});

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
        child: Stack(children: [
          SingleChildScrollView(
              child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.4,
                ),
                SvgPicture.asset(
                  "assets/Logo/congrats.svg",
                  height: size.height * 108 / 932,
                ),
                const Text(
                  "Congrats!",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: size.height * 10 / 932,
                ),
                Text(
                  "Your password reset succesfully",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xff757575),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: size.width * 13 / 320),
                ),
                SizedBox(
                  height: size.height * 30 / 932,
                ),
                logbtn(
                  mainColor: mainColor,
                  text: "Return to sign in",
                  onTapFun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const logIn()),
                    );
                  },
                )
              ],
            ),
          )),
          Container(alignment: Alignment.topLeft, child: const backBtn()),
        ]),
      ),
    );
  }
}
