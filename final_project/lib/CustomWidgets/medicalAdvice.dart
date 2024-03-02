import 'package:flutter/material.dart';

class midical_advice extends StatelessWidget {
  const midical_advice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(size.height * 20 / 932),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xff8CE7E7),
            Color(0xff50B7C5)
          ], // Change colors as per your preference
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      height: size.height * 200 / 932,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height * 8 / 932,
          ),
          Text(
            "Track your journey",
            style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: size.height * 40 / 932),
          ),
          SizedBox(
            height: size.height * 8 / 932,
          ),
          Text(
            "Blood test will help you to monitor your health",
            style: TextStyle(
                color: const Color(0xff707070),
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: size.height * 25 / 932),
          ),
        ]),
      ),
    );
  }
}
