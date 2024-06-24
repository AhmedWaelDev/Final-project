import 'package:final_project/CustomWidgets/PaymentCard.dart';
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
    required this.onTap,
  }) : super(key: key);

  final String txt;
  final String txt1;
  final String txt2;
  final String txt3;
  final Color rectColor;
  final Color textColor;
  final Color textColorContainr;
  final VoidCallback? onTap;
  @override
  State<CustomPayment> createState() => _CustomPaymentState();
}

class _CustomPaymentState extends State<CustomPayment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.only(
            left: size.width * 15 / 430,
            right: size.width * 15 / 430,
            top: size.width * 15 / 430),
        height: size.height * 100 / 932,
        width: size.width * 350 / 430, //
        child: Column(
          children: [
            SizedBox(
              height: size.height * 80 / 932, //
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
                              fontSize: size.width * 30 / 430,
                              //
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 3 / 932),
                        Flexible(
                          child: Text(
                            widget.txt1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 16 / 430, //
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
                                    fontSize: size.width * 12 / 430, //
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 12 / 932), //
                          Flexible(
                            child: Text(
                              widget.txt3,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: widget.textColor,
                                fontSize: size.width * 16 / 430, //
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
      ),
    );
  }
}

class detailsPayment extends StatefulWidget {
  const detailsPayment({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.Total,
    this.nameController,
    this.dateController,
    this.numberController,
    this.cvvController,
  });
  final String subtotal;
  final String discount;
  final String Total;
  final TextEditingController? nameController;
  final TextEditingController? dateController;
  final TextEditingController? numberController;
  final TextEditingController? cvvController;

  @override
  State<detailsPayment> createState() => _detailsPaymentState();
}

class _detailsPaymentState extends State<detailsPayment> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: const Color(0xffe5e9f0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 30 / 932,
          ),
          Container(
            child: PaymentCard(
              label: "Card Name ",
              mycontroller: widget.nameController,
            ),
          ),
          Container(
            child: PaymentCard(
                label: "Card Number ", mycontroller: widget.numberController),
          ),
          SizedBox(
            height: size.height * 20 / 932,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: PaymentCard(
                    label: "CVV ",
                    mycontroller: widget.cvvController,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 20 / 360,
              ),
              Expanded(
                child: Container(
                  child: PaymentCard(
                    label: "DateCard ",
                    mycontroller: widget.dateController,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 90 / 932,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Subtotal',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xff757575),
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.subtotal, //
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 10 / 932,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Discount',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, color: Color(0xff757575)),
                ),
              ),
              Expanded(
                child: Text(
                  widget.discount,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 10 / 932,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Total',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18, color: Color(0xff757575)),
                ),
              ),
              Expanded(
                child: Text(
                  widget.Total,
                  textAlign: TextAlign.right,
                  style:
                      const TextStyle(fontSize: 18, color: Color(0xff000000)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 30 / 932,
          ),
        ],
      ),
    );
  }
}
