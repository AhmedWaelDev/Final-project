import 'package:flutter/material.dart';
import 'package:final_project/CustomWidgets/chats.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: size.width * 35 / 320,
              right: size.width * 10 / 320,
              left: size.width * 10 / 320),
          height: size.height,
          width: size.width,
          color: const Color(0xffe5e9f0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      borderRadius:
                          BorderRadius.circular(size.height * 25 / 932),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 20 / 932,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Online Doctors",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(
                        0xff757575,
                      )),
                ),
              ),
              SizedBox(
                height: size.height * 15 / 932,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: size.height * 60 / 930,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Container(
                                width: size.width * 60 / 430,
                                height: size.height * 60 / 930,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xffe5e9f0), width: 2),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/person.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: CustomChat(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
