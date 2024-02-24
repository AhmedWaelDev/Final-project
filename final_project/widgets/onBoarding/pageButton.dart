import 'package:flutter/material.dart';

class onboardingPageButton extends StatelessWidget {
  const onboardingPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8CE7E7), // Start color (blue)
                Color(0xFF50B7C5), // End color (green)
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Text(
          "skip",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
