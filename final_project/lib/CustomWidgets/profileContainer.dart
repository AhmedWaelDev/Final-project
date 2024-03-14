import 'package:flutter/material.dart';

class profileContainer extends StatelessWidget {
  const profileContainer({
    super.key,
    required this.text,
    required this.color,
    required this.itemColor,
    required this.icon,
  });
  final String text;
  final Color? itemColor;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 15 / 932),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(size.height * 20 / 932),
          height: size.height * 80 / 932,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Color of the shadow
                  spreadRadius: 2, // Spread radius of the shadow
                  blurRadius: 7, // Blur radius of the shadow
                  offset: const Offset(0, 3), // Offset of the shadow
                ),
              ],
              color: color,
              borderRadius: BorderRadius.circular(size.height * 15 / 932)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: itemColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 24 / 932),
              ),
              Icon(
                icon,
                color: itemColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
