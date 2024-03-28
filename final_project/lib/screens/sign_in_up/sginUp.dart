import 'package:final_project/CustomWidgets/logbtn.dart';
import 'package:final_project/CustomWidgets/textForm.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/backButton.dart';
import '../../CustomWidgets/passwordTextField.dart';
import '../../CustomWidgets/socialCards.dart';

class sginUp extends StatelessWidget {
  const sginUp({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    bool obsecure = true;
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.065,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 40 / 932),
                    ),
                    SizedBox(
                      height: size.height * 10 / 932,
                    ),
                    Text(
                      "Enter your personal information",
                      style: TextStyle(
                          color: const Color(0xff757575),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: size.height * 16 / 932),
                    ),
                    SizedBox(
                      height: size.height * 15 / 932,
                    ),
                    const myTextFrom(
                        label: "Username", hint: "Enter your name"),
                    const myTextFrom(label: "Email", hint: "Enter your email"),
                    Container(
                      margin: EdgeInsets.only(bottom: size.height * 20 / 932),
                      child: Container(
                        padding: const EdgeInsets.only(top: 7),
                        child: SizedBox(
                          height: size.height * 50 / 932,
                          child: TextFormField(
                            decoration: InputDecoration(
                                prefixStyle:
                                    const TextStyle(color: Color(0xFF50B7C5)),
                                prefixIcon:
                                    Image.asset("assets/Logo/egypt.png"),
                                prefixText: "+201 ",
                                labelText: " Phone number",
                                hintStyle:
                                    const TextStyle(color: Color(0xffB2AAAA)),
                                contentPadding: EdgeInsets.only(
                                    left: size.width * 18 / 430),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25),
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ),
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return passwordTextField(
                            label: "Password",
                            hint: "Enter your password",
                            fun: () {
                              setState(
                                () {
                                  obsecure = !obsecure;
                                },
                              );
                            },
                            size: size,
                            obsecure: obsecure);
                      },
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        return passwordTextField(
                            label: "Confirm Password",
                            hint: "Enter password",
                            fun: () {
                              setState(
                                () {
                                  obsecure = !obsecure;
                                },
                              );
                            },
                            size: size,
                            obsecure: obsecure);
                      },
                    ),
                    const logbtn(mainColor: mainColor, text: "Sign up"),
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
                            "Already have an account! ",
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
                                    builder: (context) => const logIn()),
                              );
                            },
                            child: const Text(
                              "Sign in",
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
                ),
              ),
            ),
            Container(alignment: Alignment.topLeft, child: const backBtn()),
          ],
        ),
      ),
    );
  }
}
