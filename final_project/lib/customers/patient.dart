import 'package:flutter/material.dart';

import '../../CustomWidgets/screensappbar.dart';
import '../CustomWidgets/doctorAppointmentContainer.dart';

class Patient extends StatefulWidget {
  const Patient({super.key});

  @override
  State<Patient> createState() => _PatientState();
}

class _PatientState extends State<Patient> {
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
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        color: const Color(0xffe5e9f0),
        child: Column(children: [
          const screensappbar(name: "Patient"),
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
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 35 / 430,
                  right: size.width * 35 / 430,
                  top: size.height * 20 / 932),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              width: size.width * 115 / 320,
                              color: _selectedIndex == 0
                                  ? Colors.cyan
                                  : Colors.white,
                              child: TextButton(
                                child: Text(
                                  "Online",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 18 / 430,
                                    color: _selectedIndex == 0
                                        ? Colors.white
                                        : Colors.black,
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
                              width: size.width * 115 / 320,
                              color: _selectedIndex == 1
                                  ? Colors.cyan
                                  : Colors.white,
                              child: TextButton(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.width * 18 / 430,
                                    color: _selectedIndex == 1
                                        ? Colors.white
                                        : Colors.black,
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
          ),
          SizedBox(
            height: size.height * 20 / 932,
          ),
          Expanded(
              child: _selectedIndex == 0
                  ? ListView.builder(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return const doctorAppointContainer();
                      },
                    )
                  : ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return const doctorAppointContainer();
                      },
                    ))
        ]),
      ),
    );
  }
}
