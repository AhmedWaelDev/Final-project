import 'package:flutter/material.dart';

class upcomingForPatientContainer extends StatelessWidget {
  const upcomingForPatientContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        top: size.height * 20 / 932,
        right: size.height * 20 / 932,
        bottom: size.height * 30 / 932,
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
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(size.height * 20 / 932),
                    child: Image.asset(
                      "assets/images/dr.jpg",
                      height: size.height * 100 / 932,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff757575)),
                      ),
                      SizedBox(
                        width: size.width * 10 / 320,
                      ),
                      Text(
                        "Starts in 2 minute",
                        style: TextStyle(
                            fontSize: size.height * 20 / 932,
                            color: const Color(0xff757575)),
                      )
                    ],
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text("data"))
                ],
              )
            ]),
      ),
    );
  }
}
