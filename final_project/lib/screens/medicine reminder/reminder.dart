import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:final_project/cache/cache_helper.dart';
import 'package:final_project/screens/medicine%20reminder/test.dart';
import 'package:flutter/material.dart';
import '../../CustomWidgets/reminderTImeLine.dart';
import '../../roomDB/DatabaseHelper.dart';
import '../homePage/navBar.dart';
import 'addmedicine.dart';

class myReminder extends StatefulWidget {
  const myReminder({super.key});

  @override
  State<myReminder> createState() => _myReminderState();
}

class _myReminderState extends State<myReminder> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        color: bgCOlor,
        child: Column(children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                // تغيير لون خلفية الدائرة إلى الأبيض
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => myNavBar(
                          isDoctor:
                              CacheHelper().getData(key: "isDoctorAsBool"),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              Text(
                "Medicine Reminder",
                style: TextStyle(
                    fontSize: size.height * 30 / 932,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 2,
              )
            ],
          ),
          SizedBox(
            height: size.height * 20 / 932,
          ),
          SizedBox(
            height: size.height * 0.15,
            child: DatePicker(
              DateTime.now(),
              height: size.height * 100 / 932,
              width: size.width * 60 / 320,
              initialSelectedDate: DateTime.now(),
              dayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectionColor: const Color(0xFF50B7C5),
              onDateChange: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
            ),
          ),
          SizedBox(
            height: size.height * 10 / 932,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Medicine Reminder",
                  style: TextStyle(
                      fontSize: size.height * 20 / 932,
                      fontWeight: FontWeight.bold)),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(size.height * 25 / 932))),
                  color: const Color(0xFF50B7C5),
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewScreen()),
                    );
                  },
                  child: Text("+  Add New",
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold)))
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Medicine>>(
                future: DatabaseHelper().getMedicinesForDate(_selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No Medicines Found for Selected Date'));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Medicine medicine = snapshot.data![index];

                          return snapshot.data![index].id ==
                                  int.parse(CacheHelper().getData(key: "id"))
                              ? ReminderTimelineTile(
                                  amount: medicine.amount,
                                  capSize: medicine.capsize,
                                  cause: medicine.cause,
                                  duration: medicine.durationInDays,
                                  breakfast: medicine.breakfast,
                                  dinner: medicine.dinner,
                                  lunch: medicine.lunch,
                                  id: medicine.id!,
                                  medicineName: medicine.name,
                                  breakfastTime: medicine.breakfastTime,
                                  dinnerTime: medicine.dinnerTime,
                                  lunchTime: medicine.lunchTime,
                                  selectedphoto: medicine.type,
                                  isPast: false,
                                  size: size,
                                  isFirst: index == 0,
                                  isLast: index == snapshot.data!.length - 1)
                              : SizedBox(
                                  height: size.height * 550 / 932,
                                  child: const Center(
                                      child: Text(
                                          'No Medicines Found for Selected Date')),
                                ); // Remove the medicine from the list if the id doesn't match the current user's id
                        });
                  }
                }),
          ),
        ]),
      ),
    );
  }
}
