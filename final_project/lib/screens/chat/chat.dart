import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        color: const Color(0xffe5e9f0),
        child: Column(children: [
          const screensappbar(name: "Chats"),
          SizedBox(
            height: size.height * 20 / 932,
          ),
          SizedBox(
            height: size.height * 70 / 932,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.height * 25 / 932),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 20 / 932,
          ),

          
        ]),
      ),
    );
  }
}
