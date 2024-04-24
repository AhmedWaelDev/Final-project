import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/PaymentCard.dart';
import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:final_project/CustomWidgets/textForm.dart';
import 'package:final_project/Payment/payment.dart';

class BigPayment extends StatefulWidget {
  const BigPayment({super.key});

  @override
  State<BigPayment> createState() => _BigPaymentState();
}

class _BigPaymentState extends State<BigPayment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
            Container(
              child: CustomPayment(
                  txt: "Big",
                  txt1: "1000 pts",
                  txt2: "Save 5%",
                  txt3: "10 Ep",
                  rectColor: Color(0xffEBC6D9), // تحديد لون المستطيل
                  textColor: Color(0xff46abf6),
                  textColorContainr: Color(0xffE25392),
                  onTap: () {}),
            ),
            detailsPayment(
              subtotal: "Ep 10",
              discount: "5%",
              Total: "Ep 9.5",
            ),
          ],
        ),
      ),
    );
  }
}