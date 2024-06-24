import 'package:final_project/cubits/payment/cubit/payment_cubit.dart';
import 'package:final_project/screens/Payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../CustomWidgets/screensappbar.dart';

class HugePayment extends StatefulWidget {
  const HugePayment({super.key});

  @override
  State<HugePayment> createState() => _HugePaymentState();
}

class _HugePaymentState extends State<HugePayment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    txt: "Huge",
                    txt1: "2500 pts",
                    txt2: "Save 10%",
                    txt3: "100 Ep",
                    rectColor: const Color(0xffCFE1E7), // تحديد لون المستطيل
                    textColor: const Color(0xff46abf6),
                    onTap: () {},
                    textColorContainr: const Color(0xff3C93AD),
                  ),
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
                        subtotal: "Ep 100",
                        discount: "10%",
                        Total: "Ep 90",
                      ),
                      state is Paymentloading
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: size.width * 330 / 430,
                              height: size.height * 50 / 932,
                              child: MaterialButton(
                                onPressed: () {
                                  context.read<PaymentCubit>().points = 2500;
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
