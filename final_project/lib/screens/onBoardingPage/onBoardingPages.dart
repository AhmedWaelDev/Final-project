import 'package:final_project/models/onBoardingPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class onBoardingPages extends StatelessWidget {
  final onBoardingPagesmodel page;

  const onBoardingPages({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: const Color(0xffe5e9f0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(page.lottieUrl),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              page.title == null ? "" : page.title!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            page.des == null ? "" : page.des!,
            maxLines: 2,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
