import 'package:final_project/CustomWidgets/backButton.dart';
import 'package:final_project/screens/sign_in_up/forgetPass.dart';
import 'package:final_project/screens/sign_in_up/sginUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../CustomWidgets/logbtn.dart';
import '../../CustomWidgets/socialCards.dart';
import '../../CustomWidgets/textForm.dart';

class logIn extends StatelessWidget {
  const logIn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
          top: size.width * 20 / 320,
          right: size.width * 20 / 320,
          left: size.width * 20 / 320),
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
                  padding: EdgeInsets.only(top: size.width * 0.2),
                  child: SvgPicture.asset(
                    "assets/Logo/GroupLogo.svg",
                    height: size.height * 149 / 932,
                    width: size.width * 106 / 430,
                  ),
                ),
                SizedBox(
                  height: size.height * 29 / 932,
                ),
                Text(
                  "Sing in",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: size.height * 40 / 932),
                ),
                SizedBox(
                  height: size.height * 7 / 932,
                ),
                Text(
                  "Login to continue using the app",
                  style: TextStyle(
                      color: const Color(0xff757575),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: size.height * 16 / 932),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    const myTextFrom(
                      label: "Email / Phone",
                      hint: "Enter your email or phone number",
                    ),
                    const myTextFrom(
                      suf: Icon(Icons.visibility),
                      label: "Password",
                      hint: "Enter password",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Row(
                            children: [
                              Radio(
                                value: false,
                                groupValue: 'option0',
                                onChanged: (value) {},
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    color: const Color(0xffB2AAAA),
                                    fontSize: size.width * 14 / 320),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const forgetPassword()),
                            );
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: mainColor,
                                fontSize: size.width * 14 / 320),
                          ),
                        ),
                      ],
                    ),
                    const logbtn(mainColor: mainColor, text: "Sign in"),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: size.height * 18 / 932),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Divider(
                            color: Color(0xffB2AAAA),
                          )),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              child: const Text(
                                "Or Login with",
                                style: TextStyle(
                                    color: Color(0xffB2AAAA), fontSize: 16),
                              )),
                          const Expanded(
                              child: Divider(
                            color: Color(0xffB2AAAA),
                          )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        socialContainer(
                          size: size,
                          svgLogo: "assets/Logo/social/facebook.svg",
                        ),
                        socialContainer(
                          size: size,
                          svgLogo: "assets/Logo/social/google.svg",
                        ),
                        socialContainer(
                          size: size,
                          svgLogo: "assets/Logo/social/apple.svg",
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 20 / 932),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t have an account!  ",
                            style: TextStyle(
                                fontFamily: "INTER",
                                fontSize: 16,
                                color: Color(
                                  0xff757575,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const sginUp()),
                              );
                            },
                            child: const Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(
                                    0xff716ACB,
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(alignment: Alignment.topLeft, child: const backBtn()),
        ],
      ),
    ));
  }
}
