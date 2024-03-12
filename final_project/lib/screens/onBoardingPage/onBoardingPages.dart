import 'package:final_project/models/onBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class onBoardingPages extends StatelessWidget {
  final onBoardingPagesmodel page;

  const onBoardingPages({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.height * 20 / 932),
      color: const Color(0xffe5e9f0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(page.lottieUrl, height: size.height * 500 / 932),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 20 / 932),
              child: Text(
                page.title == null ? "" : page.title!,
                style: TextStyle(
                    fontSize: size.height * 24 / 932,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              page.des == null ? "" : page.des!,
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: size.height * 20 / 932),
            ),
          ],
        ),
      ),
    );
  }
}
