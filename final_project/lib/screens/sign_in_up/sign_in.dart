import 'package:final_project/cubits/auth/login/login_cubit.dart';
import 'package:final_project/screens/homePage/navBar.dart';
import 'package:final_project/screens/sign_in_up/forgetPass.dart';
import 'package:final_project/screens/sign_in_up/sginUp.dart';
import 'package:final_project/screens/sign_in_up/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../CustomWidgets/logbtn.dart';
import '../../CustomWidgets/passwordTextField.dart';
import '../../CustomWidgets/textForm.dart';

class logIn extends StatelessWidget {
  const logIn({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("success"),
            ),
          );
          context.read<LoginCubit>().getUserProfile();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const myNavBar()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
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
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Form(
                      key: context.read<LoginCubit>().logInFormKey,
                      child: Column(
                        children: [
                          myTextFrom(
                            mycontroller: context.read<LoginCubit>().logInEmail,
                            label: "Email",
                            hint: "Enter your email",
                          ),
                          passwordTextField(
                              mycontroller:
                                  context.read<LoginCubit>().logInPassword,
                              label: "Password",
                              hint: "Enter your password",
                              fun: () {
                                context.read<LoginCubit>().toggleobsecure();
                              },
                              size: size,
                              obsecure:
                                  context.read<LoginCubit>().obsecureValue),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: InkWell(
                                  onTap: () {
                                    context.read<LoginCubit>().toggleCheckbox();
                                  },
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: context
                                            .read<LoginCubit>()
                                            .checkValue,
                                        onChanged: (value) {
                                          context
                                              .read<LoginCubit>()
                                              .toggleCheckbox();
                                          print(value);
                                        },
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
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const forgetPassword()),
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
                          SizedBox(height: size.height * 0.07),
                          state is LoginLoading
                              ? const CircularProgressIndicator()
                              : logbtn(
                                  mainColor: mainColor,
                                  text: "Sign in",
                                  onTapFun: () {
                                    // context.read<LoginCubit>().login();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const myNavBar()),
                                    );
                                  },
                                ),
                          Container(
                            margin:
                                EdgeInsets.only(top: size.height * 20 / 932),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don’t have an account!  ",
                                  style: TextStyle(
                                      fontFamily: "INTER",
                                      fontSize: size.height * 16 / 932,
                                      color: const Color(
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
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontSize: size.height * 16 / 932,
                                        color: const Color(
                                          0xff716ACB,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
