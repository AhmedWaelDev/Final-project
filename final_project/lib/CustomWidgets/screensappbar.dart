import 'package:flutter/material.dart';

class screensappbar extends StatelessWidget {
  const screensappbar({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          // تغيير لون خلفية الدائرة إلى الأبيض
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black, // تغيير لون الأيقونة
            onPressed: () {
              Navigator.of(context).pop(); // للرجوع للشاشة السابقة
            },
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: size.height * 30 / 932, fontWeight: FontWeight.bold),
        ),
        const Spacer(
          flex: 2,
        )
      ],
    );
  }
}
