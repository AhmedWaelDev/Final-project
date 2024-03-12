import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/appbarWaleed.dart';
import 'package:final_project/CustomWidgets/setting.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Setting",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),

        leading: Padding(
          padding: const EdgeInsets.only(
            left: 15.5,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white, // تغيير لون خلفية الدائرة إلى الأبيض
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.black, // تغيير لون الأيقونة
              onPressed: () {
                Navigator.of(context).pop(); // للرجوع للشاشة السابقة
              },
            ),
          ),
        ),

        backgroundColor: Color(0xffe5e9f0),
        // shadowColor: Colors.white,
      ),
      body: 
      
      Column(
        
        children: [
        
          TextSetting(
            teext: "Change password",
            currentIcon: Icons.lock,
          ),
          TextSetting(
            teext: "Notifications",
            currentIcon: Icons.notification_add,
          ),
          TextSetting(
            teext: "Privacy Setting",
            currentIcon: Icons.private_connectivity,
          ),
          TextSetting(
            teext: "Delate Account",
            currentIcon: Icons.delete,
          ),
        ],
      ),
    );
  }
}
