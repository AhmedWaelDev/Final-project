import 'package:final_project/CustomWidgets/payment1.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({
    super.key,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
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
                      Center(
                        child: Text(
                          "5116 Pts",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 60 / 932,
            ),
            Container(
              child: CustomPayment(
                txt: "Starter",
                txt1: "500 pts",
                txt2: "Most popular",
                txt3: "10 Ep",
                rectColor: Color(0xffcfcef1), // تحديد لون المستطيل
                textColor: Color(0xff46abf6),
                textColorContainr: Color(0xff4342be),
                // تحديد لون النص
                onTap: () {},
              ),
            ),
            SizedBox(
              height: size.height * 20 / 932,
            ),
            Container(
              child: CustomPayment(
                txt: "Big",
                txt1: "1000 pts",
                txt2: "Save 5%",
                txt3: "10 Ep",
                rectColor: Color(0xffEBC6D9), // تحديد لون المستطيل
                textColor: Color(0xff46abf6),
                textColorContainr: Color(0xffE25392), // تحديد لون النص
                onTap: () {},
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
                rectColor: Color(0xffCFE1E7), // تحديد لون المستطيل
                textColor: Color(0xff46abf6),
                onTap: () {},
                textColorContainr: Color(0xff3C93AD), // تحديد لون النص
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
                txt3: "300 Ep",
                rectColor: Color(0xffCFE1E7), // تحديد لون المستطيل
                textColor: Color(0xff46abf6),
                textColorContainr: Color(0xff3C93AD), // تحديد لون النص
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
