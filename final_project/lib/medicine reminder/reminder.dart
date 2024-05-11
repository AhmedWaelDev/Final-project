import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/reminderTImeLine.dart';
import '../CustomWidgets/screensappbar.dart';
import '../roomDB/DatabaseHelper.dart';
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
          const screensappbar(name: "Medicine Reminder"),
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
                          builder: (context) => const AddMedicine()),
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
                      return ReminderTimelineTile(
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
                          isLast: index == snapshot.data!.length - 1);
                    },
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
