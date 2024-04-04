import 'package:flutter/material.dart';

class CustomPayment extends StatefulWidget {
  const CustomPayment({
    Key? key,
    required this.txt,
    required this.txt1,
    required this.txt2,
    required this.txt3,
    required this.rectColor,
    required this.textColor,
    required this.textColorContainr,
  }) : super(key: key);

  final String txt;
  final String txt1;
  final String txt2;
  final String txt3;
  final Color rectColor;
  final Color textColor;
  final Color textColorContainr;

  @override
  State<CustomPayment> createState() => _CustomPaymentState();
}

class _CustomPaymentState extends State<CustomPayment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.all(15),
      height: size.height * 110 / 932,
      width: size.width * 350 / 430, // عرض الشاشة يساوي 430
      child: Column(
        children: [
          SizedBox(
            height: size.height * 74 / 932, // ارتفاع العنصر الأول
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.txt,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width *
                                30 /
                                430, // حجم النص يعتمد على عرض الشاشة
                          ),
                        ),
                      ),
                      SizedBox(
                          height: size.height *
                              10 /
                              932), // مسافة بين النصوص والعناصر النصية في العمود الأول
                      Flexible(
                        child: Text(
                          widget.txt1,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width *
                                16 /
                                430, // حجم النص يعتمد على عرض الشاشة
                            color: widget.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width * 16 / 430),
                // مسافة بين الأعمدة
                Flexible(
                  child: SizedBox(
                    height: size.height * 50 / 932,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: size.height * 20 / 932,
                              width: size.width * 85 / 430,
                              decoration: BoxDecoration(
                                color: widget.rectColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                widget.txt2,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: widget.textColorContainr,
                                  fontSize: size.width *
                                      12 /
                                      430, // حجم النص يعتمد على عرض الشاشة
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: size.height *
                                12 /
                                932), // مسافة بين النصوص والعناصر النصية في العمود الثاني
                        Flexible(
                          child: Text(
                            widget.txt3,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: widget.textColor,
                              fontSize: size.width *
                                  16 /
                                  430, // حجم النص يعتمد على عرض الشاشة
                            ),
                          ),
                        ),
                      ],
                    ),
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
