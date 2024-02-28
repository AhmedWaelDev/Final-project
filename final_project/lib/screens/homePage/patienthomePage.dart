import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../waled.dart';

class patienthomePagescreen extends StatelessWidget {
  const patienthomePagescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    const mainColor = Color(0xFF50B7C5);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 20 / 320,
            left: size.width * 20 / 320),
        height: size.height,
        width: size.width,
        color: bgCOlor,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 65 / 932,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: size.height * 15 / 932),
                        child: ClipOval(
                          child: Image.asset('assets/images/person.png'),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey, Jenifer",
                            style: TextStyle(
                                fontSize: size.height * 20 / 932,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Find your Specialist",
                            style: TextStyle(
                                fontSize: size.height * 15 / 932,
                                color: const Color(0xffB2AAAA)),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AppointmentScreen()),
                          );
                        },
                        child: Container(
                          width: size.height * 45 / 932,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ], color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset('assets/icons/wallet.svg'),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          width: size.height * 45 / 932,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ], color: Colors.white, shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset('assets/icons/bell.svg'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
