import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class socialContainer extends StatelessWidget {
  const socialContainer({
    super.key,
    required this.size,
    required this.svgLogo,
  });

  final Size size;
  final String svgLogo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: size.height * 60 / 932,
        width: size.height * 60 / 932,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: SvgPicture.asset(
            svgLogo,
            height: 30,
          ),
        ),
      ),
    );
  }
}
