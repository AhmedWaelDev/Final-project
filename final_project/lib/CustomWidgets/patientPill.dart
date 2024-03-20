import 'package:flutter/material.dart';

class pill extends StatelessWidget {
  const pill({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: size.width * 5 / 320,
      ),
      height: size.height * 150 / 932,
      width: size.width * 170 / 320,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Image.asset("assets/images/pill1.png"),
            const FittedBox(child: Text("Amlodipine")),
            const FittedBox(child: Text("150mg, 1 capsule")),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(size.height * 8 / 932),
                  height: size.height * 40 / 932,
                  width: size.width * 80 / 320,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffCFE1E7)),
                  child: const FittedBox(
                    child: Text(
                      "After Lunch",
                      style: TextStyle(color: Color(0xff3C93AD)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(size.height * 8 / 932),
                  height: size.height * 40 / 932,
                  width: size.width * 80 / 320,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xffDBDAF0)),
                  child: const FittedBox(
                    child: Text(
                      "After Dinner",
                      style: TextStyle(color: Color(0xff8C86DD)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
