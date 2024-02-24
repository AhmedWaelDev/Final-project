import 'package:flutter/material.dart';

class logbtn extends StatelessWidget {
  const logbtn({
    super.key,
    required this.mainColor,
    required this.text,
    this.onTapFun,
  });

  final Color mainColor;
  final String text;
  final Function()? onTapFun;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTapFun,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: mainColor,
          borderRadius: BorderRadius.circular(size.width * 20 / 320),
        ),
        height: size.height * 50 / 932,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
    );
  }
}
