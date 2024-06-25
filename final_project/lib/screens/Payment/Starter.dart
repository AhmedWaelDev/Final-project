import 'package:final_project/cubits/payment/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StarterPayment extends StatefulWidget {
  const StarterPayment({super.key});

  @override
  State<StarterPayment> createState() => _StarterPaymentState();
}

class _StarterPaymentState extends State<StarterPayment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const int points = 500;
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("success"),
          ));
          context.read<PaymentCubit>().paymentCardName.clear();
          context.read<PaymentCubit>().paymentCardCvv.clear();
          context.read<PaymentCubit>().paymentCardDate.clear();
          context.read<PaymentCubit>().paymentCardNumber.clear();
          context.read<PaymentCubit>().points = 0;
        } else if (state is PaymentFailure) {
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
              top: size.width * 35 / 320,
              right: size.width * 10 / 320,
              left: size.width * 10 / 320,
            ),
            height: size.height,
            width: size.width,
            color: const Color(0xffe5e9f0),
            child: Column(
              children: [
                const screensappbar(name: "Payment"),
                SizedBox(
                  height: size.height * 50 / 932,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomPayment(
                      txt: "Starter",
                      txt1: "500 pts",
                      txt2: "Most popular",
                      txt3: "30 Ep",
                      rectColor: const Color(0xffcfcef1),
                      textColor: const Color(0xff46abf6),
                      textColorContainr: const Color(0xff4342be),
                      onTap: () {
                        context.read<PaymentCubit>().payment();
                      }),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      detailsPayment(
                        nameController:
                            context.read<PaymentCubit>().paymentCardName,
                        cvvController:
                            context.read<PaymentCubit>().paymentCardCvv,
                        dateController:
                            context.read<PaymentCubit>().paymentCardDate,
                        numberController:
                            context.read<PaymentCubit>().paymentCardNumber,
                        subtotal: "Ep 30",
                        discount: "0%",
                        Total: "Ep 30",
                      ),
                      state is PaymentLoading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: size.width * 330 / 430,
                              height: size.height * 50 / 932,
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<PaymentCubit>().points = 500;
                                  context.read<PaymentCubit>().payment();
                                },
                                color: const Color(0xff50b7c5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: const Text(
                                  'Payment',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
