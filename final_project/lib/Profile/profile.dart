import 'package:flutter/material.dart';

void main() {}

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 25,
                ),
                Center(
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: Icon(
                    Icons.edit_note_sharp,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
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
          ),
          backgroundColor: const Color(0xffe5e9f0),
          // shadowColor: Colors.white,
        ),
        backgroundColor: Color(0xffe5e9f0),
        body: Stack(
          children: [
            // الصورة
            Positioned(
              top: size.height * 40 / 932,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100, //
                  //  backgroundImage: AssetImage(''), // مسار الصورة
                ),
              ),
            ),
            //
            Positioned(
              top: size.height * 230 / 932,
              right: size.width * 130 / 430,
              child: FloatingActionButton(
                backgroundColor: Color(0xffFFFFFF),
                onPressed: () {
                  // تنفيذ إجراء عند الضغط على زر الكاميرا
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: size.width * 37 / 430,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
