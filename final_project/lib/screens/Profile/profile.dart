import 'package:final_project/cubits/profile/cubit/photo_cubit.dart';
import 'package:final_project/cubits/profile/cubit/photo_state.dart';
import 'package:final_project/screens/Payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../CustomWidgets/profileContainer.dart';
import '../Setting/setting.dart';
import 'Personal.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    context.read<PhotoCubit>().loadImagePath();
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
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    context.read<PhotoCubit>().pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    context.read<PhotoCubit>().pickImage(ImageSource.camera);
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
                      MaterialPageRoute(builder: (context) => const Profile()),
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
                  BlocBuilder<PhotoCubit, PhotoState>(
                    builder: (context, state) {
                      if (state is PhotoLoaded) {
                        return CircleAvatar(
                          radius: size.height * 90 / 932,
                          backgroundImage: FileImage(state.image),
                        );
                      } else {
                        return CircleAvatar(
                          radius: size.height * 90 / 932,
                          backgroundImage:
                              const AssetImage("assets/photo/Mask group.png"),
                        );
                      }
                    },
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
