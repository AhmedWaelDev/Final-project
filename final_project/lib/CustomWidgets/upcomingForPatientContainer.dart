import 'package:flutter/material.dart';

class upcomingForPatientContainer extends StatelessWidget {
  const upcomingForPatientContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const mainColor = Color(0xFF50B7C5);
    return Container(
      padding: EdgeInsets.only(
        right: size.height * 20 / 932,
        left: size.height * 40 / 932,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: const SingleChildScrollView(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(
            children: [Text("data")],
          ),
          Row(
            children: [Text("data")],
          )
        ]),
      ),
    );
  }
}
