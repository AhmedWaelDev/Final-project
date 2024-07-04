import 'package:final_project/cubits/auth/login/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import Flutter Bloc for BlocBuilder
import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:final_project/screens/Payment/Big.dart';
import 'package:final_project/screens/Payment/Enormous.dart';
import 'package:final_project/screens/Payment/Huge.dart';
import 'package:final_project/screens/Payment/Starter.dart';

// Import your PaymentCubit and payment_state.dart

class Payment extends StatefulWidget {
  const Payment({
    super.key,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    // Load points when the widget initializes
    context.read<LoginCubit>().getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is getUserDataSuccess) {
            return buildPaymentUI(
                size, state.user.points ?? 0); // Pass points to buildPaymentUI
          } else if (state is getUserDataLoading) {
            // Handle other states if needed
            return const Center(child: CircularProgressIndicator());
          } else if (state is getUserDataFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(
              child: TextButton(
                onPressed: () {
                  context.read<LoginCubit>().getUserProfile();
                },
                child: const Text("try again"),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildPaymentUI(Size size, int points) {
    return Container(
      padding: EdgeInsets.only(
          top: size.width * 35 / 320,
          right: size.width * 10 / 320,
          left: size.width * 10 / 320),
      height: size.height,
      width: size.width,
      color: const Color(0xffe5e9f0),
      child: Column(
        children: [
          const screensappbar(name: "Payment"),
          SizedBox(
            height: size.height * 20 / 932,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            height: size.height * 100 / 932,
            width: size.width * 210 / 320,
            child: Padding(
              padding: EdgeInsets.only(
                  top: size.width * 20 / 320,
                  right: size.width * 10 / 320,
                  left: size.width * 10 / 320),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "$points Pts", // Display dynamic points here
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * 60 / 932,
                ),
                Container(
                  child: CustomPayment(
                    txt: "Starter",
                    txt1: "500 pts",
                    txt2: "Most popular",
                    txt3: "30 Ep",
                    rectColor: const Color(0xffcfcef1),
                    textColor: const Color(0xff46abf6),
                    textColorContainr: const Color(0xff4342be),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StarterPayment()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Container(
                  child: CustomPayment(
                    txt: "Big",
                    txt1: "1000 pts",
                    txt2: "Save 10%",
                    txt3: "50 Ep",
                    rectColor: const Color(0xffEBC6D9),
                    textColor: const Color(0xff46abf6),
                    textColorContainr: const Color(0xffE25392),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BigPayment()));
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Container(
                  child: CustomPayment(
                    txt: "Huge",
                    txt1: "2500 pts",
                    txt2: "Save 10%",
                    txt3: "100 Ep",
                    rectColor: const Color(0xffCFE1E7),
                    textColor: const Color(0xff46abf6),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HugePayment()));
                    },
                    textColorContainr: const Color(0xff3C93AD),
                  ),
                ),
                SizedBox(
                  height: size.height * 20 / 932,
                ),
                Container(
                  child: CustomPayment(
                    txt: "Enormous",
                    txt1: "5000 pts",
                    txt2: "Save 20%",
                    txt3: "200 Ep",
                    rectColor: const Color(0xffCFE1E7),
                    textColor: const Color(0xff46abf6),
                    textColorContainr: const Color(0xff3C93AD),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EnormousPayment()));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
