import 'package:final_project/cubits/auth/change_password/change_password_cubit.dart';
import 'package:final_project/screens/sign_in_up/congrats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../CustomWidgets/backButton.dart';
import '../../CustomWidgets/logbtn.dart';
import '../../CustomWidgets/passwordTextField.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    bool obsecure = true;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(size.width * 15 / 320),
      height: size.height,
      width: size.width,
      color: bgCOlor,
      child: Stack(children: [
        ListView(physics: const BouncingScrollPhysics(), children: [
          SizedBox(
            height: size.height * 120 / 932,
          ),
          Container(
              height: size.height * 0.2,
              margin: EdgeInsets.symmetric(vertical: size.height * 20 / 932),
              child: SvgPicture.asset("assets/Logo/GroupLogo.svg",
                  height: size.height * 20 / 932)),
          SizedBox(
            height: size.height * 30 / 932,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 20 / 932),
                child: Center(
                  child: Text(
                    "change password",
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 30 / 320),
                  ),
                ),
              ),
              passwordTextField(
                  label: "currnet password",
                  hint: "Enter your current password",
                  fun: () {
                    context.read<ChangePasswordCubit>().toggleobsecure();
                  },
                  size: size,
                  obsecure: context.read<ChangePasswordCubit>().obsecureValue),
              passwordTextField(
                  label: "New password",
                  hint: "Enter your new password",
                  fun: () {
                    context.read<ChangePasswordCubit>().toggleobsecure();
                  },
                  size: size,
                  obsecure: context.read<ChangePasswordCubit>().obsecureValue),
              passwordTextField(
                  label: "confirm password",
                  hint: "confrim your new password",
                  fun: () {
                    context.read<ChangePasswordCubit>().toggleobsecure();
                  },
                  size: size,
                  obsecure: context.read<ChangePasswordCubit>().obsecureValue),
              Container(
                margin: EdgeInsets.only(top: size.height * 30 / 932),
                child: logbtn(
                  mainColor: mainColor,
                  text: 'Confirm',
                  onTapFun: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const congrats()),
                    );
                  },
                ),
              ),
            ],
          )
        ]),
        Container(alignment: Alignment.topLeft, child: const backBtn()),
      ]),
    ));
  }
}
