import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class backBtn extends StatelessWidget {
  const backBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 39,
          width: 39,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(13)),
          ),
          child: SvgPicture.asset(
            "assets/Logo/backbtn.svg",
            height: 20,
            width: 11,
            fit: BoxFit.none,
          ),
        ));
  }
}
