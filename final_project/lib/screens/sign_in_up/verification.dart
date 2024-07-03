import 'package:final_project/CustomWidgets/logbtn.dart';
import 'package:final_project/CustomWidgets/otpTextForm.dart';
import 'package:final_project/cubits/auth/register/register_cubit.dart';
import 'package:final_project/screens/sign_in_up/registerCongrats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../CustomWidgets/backButton.dart';

class verification extends StatelessWidget {
  const verification({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    String? otpCode;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is otpSuccess) {
          {
            context.read<RegisterCubit>().otp1.clear();
            context.read<RegisterCubit>().otp2.clear();
            context.read<RegisterCubit>().otp3.clear();
            context.read<RegisterCubit>().otp4.clear();
            context.read<RegisterCubit>().otp5.clear();
            context.read<RegisterCubit>().otp6.clear();
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const RegisterCongrats()),
          );
        } else if (state is otpFailure) {
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
                      OtpTextFormField(
                        otp1: context.read<RegisterCubit>().otp1,
                        otp2: context.read<RegisterCubit>().otp2,
                        otp3: context.read<RegisterCubit>().otp3,
                        otp4: context.read<RegisterCubit>().otp4,
                        otp5: context.read<RegisterCubit>().otp5,
                        otp6: context.read<RegisterCubit>().otp6,
                      ),
                      SizedBox(
                        height: size.height * 20 / 932,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: size.height * 30 / 932),
                        child: state is otpLoading
                            ? const CircularProgressIndicator()
                            : logbtn(
                                mainColor: mainColor,
                                text: "Verify",
                                onTapFun: () {
                                  context
                                      .read<RegisterCubit>()
                                      .otpFunction(otpCode, email);
                                },
                              ),
                      ),
                      SizedBox(
                        height: size.height * 10 / 932,
                      ),
                    ],
                  ),
                ),
                Container(alignment: Alignment.topLeft, child: const backBtn()),
              ],
            ),
          ),
        );
      },
    );
  }
}
