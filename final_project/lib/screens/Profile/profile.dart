import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import '../../CustomWidgets/profileContainer.dart';
import '../Setting/setting.dart';
import 'Personal.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
            Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text("My profile",
                    style: TextStyle(
                        fontSize: size.height * 30 / 932,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                MaterialButton(
                  minWidth: size.height * 42 / 932,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const profile()),
                    );
                  },
                  child: Container(
                    height: size.height * 42 / 932,
                    width: size.height * 42 / 932,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(Icons.edit_square),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 30 / 932,
            ),
            //mainPhoto
            SizedBox(
              height: size.height * 180 / 932,
              width: size.height * 180 / 932,
              child: Stack(
                children: [
                  CircleAvatar(
                      radius: size.height * 90 / 932,
                      backgroundImage:
                          const AssetImage("assets/photo/Mask group.png")),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          minWidth: size.height * 45 / 932,
                          onPressed: () {},
                          child: Container(
                            height: size.height * 45 / 932,
                            width: size.height * 45 / 932,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                            child: const Icon(Icons.camera_alt_outlined),
                          )))
                ],
              ),
            ),
            Text(
              "Jasmin khatun",
              style: TextStyle(
                  fontSize: size.height * 24 / 932,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 5 / 932,
            ),
            Text(
              "28 years old",
              style: TextStyle(
                  fontSize: size.height * 20 / 932,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff757575)),
            ),
            SizedBox(
              height: size.height * 30 / 932,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  profileContainer(
                    icon: Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    text: "Settings",
                    itemColor: Colors.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Setting()),
                      );
                    },
                  ),
                  profileContainer(
                    icon: Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    text: "Payment",
                    itemColor: Colors.black,
                    onTap: () {},
                  ),
                  profileContainer(
                    icon: Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    text: "Language",
                    itemColor: Colors.black,
                    onTap: () {},
                  ),
                  profileContainer(
                    icon: Icons.exit_to_app_outlined,
                    color: const Color(0xffE6C9CE),
                    text: "Logout",
                    itemColor: const Color(0xffD23A2D),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const logIn()),
                      );
                    },
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
