import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/payment1.dart';

import '../CustomWidgets/screensappbar.dart';

class EnormousPayment extends StatefulWidget {
  const EnormousPayment({super.key});

  @override
  State<EnormousPayment> createState() => _EnormousPaymentState();
}

class _EnormousPaymentState extends State<EnormousPayment> {
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
            SizedBox(
              width: double.infinity,
              child: CustomPayment(
                txt: "Enormous",
                txt1: "5000 pts",
                txt2: "Save 20%",
                txt3: "300 Ep",
                rectColor: const Color(0xffCFE1E7), // تحديد لون المستطيل
                textColor: const Color(0xff46abf6),
                textColorContainr: const Color(0xff3C93AD), // تحديد لون النص
                onTap: () {},
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  detailsPayment(
                    subtotal: "Ep 300",
                    discount: "20%",
                    Total: "Ep 280",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
