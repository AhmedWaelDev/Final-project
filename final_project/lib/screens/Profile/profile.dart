import 'package:final_project/screens/Payment/payment.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../../CustomWidgets/profileContainer.dart';
import '../Setting/setting.dart';
import 'Personal.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImagePath();
  }

  Future<void> _loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = prefs.getString('profile_image_path');
      if (_imagePath != null) {
        _image = File(_imagePath!);
      }
    });
  }

  Future<void> _saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image_path', path);
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _saveImagePath(pickedFile.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Photo Library'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text('Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
                    backgroundImage: _image == null
                        ? const AssetImage("assets/photo/Mask group.png")
                        : FileImage(_image!) as ImageProvider,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(
                          minWidth: size.height * 45 / 932,
                          onPressed: () => _showPicker(context),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Payment()),
                      );
                    },
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
                      CacheHelper().removeData(key: "isDoctor");

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
