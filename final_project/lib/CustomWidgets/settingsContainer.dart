import 'package:flutter/material.dart';

class settingsContainer extends StatelessWidget {
  const settingsContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });
  final IconData icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(
          size.height * 20 / 932,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: size.height * 30 / 932,
                  color: color,
                ),
                SizedBox(
                  width: size.width * 20 / 320,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: color,
                      fontSize: size.height * 20 / 932,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: size.height * 30 / 932,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
