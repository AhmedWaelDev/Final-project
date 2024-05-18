import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';

class HugePayment extends StatefulWidget {
  const HugePayment({super.key});

  @override
  State<HugePayment> createState() => _HugePaymentState();
}

class _HugePaymentState extends State<HugePayment> {
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
            const detailsPayment(
              subtotal: "Ep 100",
              discount: "10%",
              Total: "Ep 90",
            ),
          ],
        ),
      ),
    );
  }
}
