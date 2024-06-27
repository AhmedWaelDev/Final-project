import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/screensappbar.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<profile> {
  DateTime selectedDate = DateTime.now();
  String? newSelectedDate;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String? selectedGender;
    String? selectedBloodGroup;

    return Scaffold(
      body: Container(
        color: const Color(0xffe5e9f0),
        padding: EdgeInsets.only(
            top: size.width * 20 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        child: Column(
          children: [
            const screensappbar(name: "Personal Information"),
            SizedBox(height: size.height * 10 / 932),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    //First Name
                    SizedBox(height: size.height * 10 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    // SizedBox(height: size.height*5/932,),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter your name",
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 5 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "Date of birth",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    //  SizedBox(height: size.height*5/932,),
                    Container(
                      height: size.height * 70 / 932,
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height *
                                    0.4, // Adjusted height to fit content
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height:
                                          250, // Adjusted height to fit content
                                      child: CupertinoDatePicker(
                                        mode: CupertinoDatePickerMode.date,
                                        initialDateTime: selectedDate,
                                        onDateTimeChanged:
                                            (DateTime newDateTime) {
                                          setState(() {
                                            selectedDate = newDateTime;
                                            newSelectedDate = newDateTime
                                                .toString()
                                                .replaceFirst(
                                                    " 00:00:00.000", "");
                                          });
                                        },
                                      ),
                                    ),
                                    CupertinoButton(
                                      color: const Color(
                                          0xff050b7c5), // Main color
                                      child: const Text(
                                        'Done',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        // Optionally, handle the selected date after closing the modal
                                        print(
                                            'Selected date: $newSelectedDate');
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              25), // Adjust the border radius as needed
                          side: const BorderSide(
                              color: Colors.black), // Set the border color
                        ),
                        color: Colors
                            .white, // Background color to match the text field
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Select Date: ${selectedDate.toLocal()}'
                                .split(' ')[0],
                            style: const TextStyle(
                                color: Colors
                                    .black), // Text color to match the placeholder text
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 15 / 932),

                    //  SizedBox(height: size.height*5/932,),
                    Container(
                      decoration: const BoxDecoration(),
                      height: size.height * 70 / 932,
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        hint: const Text(
                          'Pick gender',
                          style: TextStyle(color: Colors.black),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        },
                        items: <String>['Male', 'Female'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: size.height * 15 / 932),
                    Container(
                      decoration: const BoxDecoration(
                          // Add your decoration properties here
                          ),
                      height: MediaQuery.of(context).size.height * 70 / 932,
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 52 / 430,
                        right: MediaQuery.of(context).size.width * 52 / 430,
                        top: MediaQuery.of(context).size.height * 12 / 932,
                      ),
                      width: double.infinity,
                      child: DropdownButtonFormField<String>(
                        value: selectedBloodGroup,
                        hint: const Text(
                          'Pick blood group',
                          style: TextStyle(color: Colors.black),
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedBloodGroup = newValue;
                          });
                        },
                        items: <String>[
                          'A+',
                          'A-',
                          'B+',
                          'B-',
                          'AB+',
                          'AB-',
                          'O+',
                          'O-',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: size.height * 15 / 932),
                    // SizedBox(height: size.height*5/932,),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter your blood group",
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 5 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "Phone number",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    //  SizedBox(height: size.height*5/932,),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 5 / 932),
                    Padding(
                      padding: EdgeInsets.only(left: size.width * 48 / 430),
                      child: const Row(
                        children: [
                          Text(
                            "E-mail",
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
                          )
                        ],
                      ),
                    ),

                    // SizedBox(height: size.height*5/932,),
                    Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 52 / 430,
                          right: size.width * 52 / 430,
                          top: size.height * 12 / 932),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),

                    //Button
                    SizedBox(height: size.height * 20 / 932),
                    SizedBox(
                      width: size.width * 330 / 430,
                      height: size.height * 50 / 932,
                      child: MaterialButton(
                        onPressed: () {
                          // Save button action
                        },
                        color: const Color(0xff50b7c5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
