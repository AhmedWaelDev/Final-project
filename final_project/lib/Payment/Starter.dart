import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';

class StarterPayment extends StatefulWidget {
  const StarterPayment({super.key});

  @override
  State<StarterPayment> createState() => _StarterPaymentState();
}

class _StarterPaymentState extends State<StarterPayment> {
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
                  txt: "Starter",
                  txt1: "500 pts",
                  txt2: "Most popular",
                  txt3: "10 Ep",
                  rectColor: const Color(0xffcfcef1),
                  textColor: const Color(0xff46abf6),
                  textColorContainr: const Color(0xff4342be),
                  onTap: () {}),
            ),
            const detailsPayment(
              subtotal: "Ep 10",
              discount: "Ep 0",
              Total: "Ep 10",
            ),
          ],
        ),
      ),
    );
  }
}
