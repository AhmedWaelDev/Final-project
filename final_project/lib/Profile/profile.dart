import 'package:final_project/Profile/Personal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatelessWidget {
  const Profile({Key? key});

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
                  padding: EdgeInsets.only(left: 50),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit_note_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => App()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          backgroundColor: const Color(0xffe5e9f0),
        ),
        backgroundColor: Color(0xffe5e9f0),
        body: Stack(
          children: [
            Positioned(
              top: size.height * 40 / 932,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('Mask group.png'),
                ),
              ),
            ),
            Positioned(
              top: size.height * 230 / 932,
              right: size.width * 130 / 430,
              child: FloatingActionButton(
                backgroundColor: Color(0xffFFFFFF),
                onPressed: () {
                  // Handle camera button press
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

class Name extends StatelessWidget {
  final String name;
  final String age;

  const Name({Key? key, required this.name, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 24 / 430,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 7 / 932),
          Text(
            age,
            style: TextStyle(
              color: Color(0xff757575),
              fontSize: size.width * 15 / 430,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
