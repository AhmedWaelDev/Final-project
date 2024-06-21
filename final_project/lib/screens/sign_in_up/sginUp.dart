import 'package:final_project/CustomWidgets/logbtn.dart';
import 'package:final_project/CustomWidgets/textForm.dart';
import 'package:final_project/cubits/auth/register/register_cubit.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../CustomWidgets/backButton.dart';
import '../../CustomWidgets/passwordTextField.dart';

class sginUp extends StatelessWidget {
  const sginUp({super.key});

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
              child: Center(
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("success"),
                        ),
                      );
                    } else if (state is RegisterFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Form(
                      key: context.read<RegisterCubit>().RegisterFormKey,
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
                          myTextFrom(
                              mycontroller:
                                  context.read<RegisterCubit>().RegisterName,
                              label: "Username",
                              hint: "Enter your name"),
                          myTextFrom(
                              mycontroller:
                                  context.read<RegisterCubit>().RegisterEmail,
                              label: "Email",
                              hint: "Enter your email"),
                          Container(
                            margin:
                                EdgeInsets.only(bottom: size.height * 20 / 932),
                            child: Container(
                              padding: const EdgeInsets.only(top: 7),
                              child: SizedBox(
                                height: size.height * 50 / 932,
                                child: TextFormField(
                                  controller: context
                                      .read<RegisterCubit>()
                                      .RegisterPhoneNumber,
                                  decoration: InputDecoration(
                                      prefixStyle: const TextStyle(
                                          color: Color(0xFF50B7C5)),
                                      prefixIcon:
                                          Image.asset("assets/Logo/egypt.png"),
                                      prefixText: "+2 ",
                                      labelText: " Phone number",
                                      hintStyle: const TextStyle(
                                          color: Color(0xffB2AAAA)),
                                      contentPadding: EdgeInsets.only(
                                          left: size.width * 18 / 430),
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ),
                          ),
                          passwordTextField(
                              mycontroller: context
                                  .read<RegisterCubit>()
                                  .RegisterPassword,
                              label: "Password",
                              hint: "Enter your password",
                              fun: () {
                                context.read<RegisterCubit>().toggleobsecure();
                              },
                              size: size,
                              obsecure:
                                  context.read<RegisterCubit>().obsecureValue),
                          passwordTextField(
                              mycontroller: context
                                  .read<RegisterCubit>()
                                  .RegisterConfirmPassword,
                              label: "Confirm Password",
                              hint: "Enter password",
                              fun: () {
                                context
                                    .read<RegisterCubit>()
                                    .toggleConfirmobsecure();
                              },
                              size: size,
                              obsecure: context
                                  .read<RegisterCubit>()
                                  .confirmObsecureValue),
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          state is RegisterLoading
                              ? const CircularProgressIndicator()
                              : InkWell(
                                  onTap: () {
                                    context
                                        .read<RegisterCubit>()
                                        .registerFunction();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(
                                          size.width * 20 / 320),
                                    ),
                                    height: size.height * 50 / 932,
                                    child: const Center(
                                        child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    )),
                                  ),
                                ),
                          Container(
                            margin:
                                EdgeInsets.only(top: size.height * 20 / 932),
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
                    );
                  },
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
