import 'package:final_project/CustomWidgets/DoctorCard.dart';
import 'package:final_project/CustomWidgets/cardComplete.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/screensappbar.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
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
                name: "Doctors",
              ),
              SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                borderRadius: BorderRadius.circular(
                                    size.height * 25 / 932),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ]))),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 25 / 430,
                      right: size.width * 25 / 430,
                      top: size.height * 20 / 932),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: Container(
                                width: size.width * 163 / 430,
                                color: _selectedIndex == 0
                                    ? Colors.cyan
                                    : Colors.white,
                                child: TextButton(
                                  child: Center(
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 24 / 430,
                                        color: _selectedIndex == 0
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selectedIndex = 0;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Container(
                                width: size.width * 163 / 430,
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.white,
                                child: TextButton(
                                  child: Center(
                                    child: Text(
                                      "Online",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.width * 24 / 430,
                                        color: _selectedIndex == 1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selectedIndex = 1;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 32 / 932,
              ),
              if (_selectedIndex == 0)
                SizedBox(
                  width: size.width * 360 / 430,
                  child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        DoctorCard(
                          name: " DR Noha",
                          rating: 3.5,
                          specialty: "Pediatricain",
                          onChatPressed: () {},
                          onVideoCallPressed: () {},
                          video: 'Video call',
                        ),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        DoctorCard(
                          name: " DR Memo",
                          rating: 4,
                          specialty: "Pediatricain",
                          onChatPressed: () {},
                          onVideoCallPressed: () {},
                          video: 'Video call',
                        )
                      ]),
                )
              else if (_selectedIndex == 1)
                SizedBox(
                  width: size.width * 360 / 430,
                  child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        cardComplete(
                            name: "Dr.Sara",
                            rating: 2.5,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                            name: "Dr.nermin",
                            rating: 4.5,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                            name: "Dr.asmaa",
                            rating: 2.6,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                            name: "Dr.yomna",
                            rating: 2.7,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                            name: "Dr.yassmin",
                            rating: 3.4,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                            name: "Dr.Sara",
                            rating: 3.2,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                            name: "Dr.nada",
                            rating: 3.8,
                            specialty: "Pediatricain",
                            onChatPressed: () {},
                            onVideoCallPressed: () {}),
                        SizedBox(
                          height: size.height * 19 / 932,
                        ),
                        cardComplete(
                          name: "Dr. Ahmed",
                          rating: 3.8,
                          specialty: "Dermatologist",
                          onChatPressed: () {},
                          onVideoCallPressed: () {},
                        ),
                        SizedBox(height: size.height * 19 / 932),
                      ]),
                )
            ],
          ),
        ),
      ]),
    ));
  }
}
