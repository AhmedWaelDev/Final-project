import 'package:final_project/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../waled.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({
    super.key,
    required this.name,
    required this.isDoctor,
    required this.image,
  });
  final String name;
  final bool isDoctor;
  final String image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 65 / 932,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isDoctor == false
                  ? Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: size.height * 15 / 932),
                          child: ClipOval(
                            child: Image.asset(image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hey, $name",
                              style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Find your Speciealist",
                              style: TextStyle(
                                  fontSize: size.height * 15 / 932,
                                  color: const Color(0xffB2AAAA)),
                            )
                          ],
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: size.height * 15 / 932),
                          child: ClipOval(
                            child: Image.asset(image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 16 / 932,
                                  color: const Color(0xffB2AAAA)),
                            ),
                            Text(
                              "Dr. $name",
                              style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  fontWeight: FontWeight.bold),
                            ),
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
                            builder: (context) => const Profile()),
                      );
                    },
                    child: Container(
                      width: size.height * 45 / 932,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
                          offset:
                              const Offset(0, 3), // changes position of shadow
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
    );
  }
}
