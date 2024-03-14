import 'package:flutter/material.dart';

import '../../CustomWidgets/screensappbar.dart';
import '../../CustomWidgets/settingsContainer.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color(0xffe5e9f0),
        padding: EdgeInsets.only(
            top: size.width * 20 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const screensappbar(
              name: "Setting",
            ),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 30 / 932,
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    const settingsContainer(
                      color: Colors.black,
                      icon: Icons.lock_outlined,
                      text: "Change password",
                    ),
                    const settingsContainer(
                      color: Colors.black,
                      icon: Icons.notifications,
                      text: "Notifications",
                    ),
                    const settingsContainer(
                      color: Colors.black,
                      icon: Icons.privacy_tip_sharp,
                      text: "Privacy Setting",
                    ),
                    const settingsContainer(
                      color: Color(0xffC00000),
                      icon: Icons.delete,
                      text: "Delate Account",
                    ),
                    SizedBox(
                      height: size.height * 50 / 932,
                    ),
                    Text(
                      "Options",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
