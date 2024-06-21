import 'package:flutter/material.dart';

class appbarr extends StatefulWidget {
  final String Textt;
  const appbarr({super.key, required this.Textt});

  @override
  State<appbarr> createState() => _appbarrState();
}

class _appbarrState extends State<appbarr> {
  @override
  Widget build(BuildContext context) {
    return
        //
        AppBar(
      elevation: 0,
      title: Text(
        widget.Textt,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),

      leading: Padding(
        padding: const EdgeInsets.only(
          left: 15.5,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white, // تغيير لون خلفية الدائرة إلى الأبيض
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.black, // تغيير لون الأيقونة
            onPressed: () {
              Navigator.of(context).pop(); // للرجوع للشاشة السابقة
            },
          ),
        ),
      ),

      backgroundColor: const Color(0xffe5e9f0),
      // shadowColor: Colors.white,
    );
  }
}
