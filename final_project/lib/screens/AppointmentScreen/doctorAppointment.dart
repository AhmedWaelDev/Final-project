import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../CustomWidgets/timeLIneListTile.dart';

class doctorAppointment extends StatelessWidget {
  const doctorAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgCOlor = Color(0xffe5e9f0);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(
            top: size.width * 20 / 320,
          ),
          child: const Center(
              child: Text(
            "Appointment",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          )),
        ),
        backgroundColor: bgCOlor,
      ),
      body: Container(
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        height: size.height,
        width: size.width,
        color: bgCOlor,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.15,
              child: DatePicker(
                DateTime.now(),
                height: size.height * 100 / 932,
                width: size.width * 60 / 320,
                initialSelectedDate: DateTime.now(),
                daysCount: 10,
                dayTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                selectionColor: const Color(0xFF50B7C5),
                onDateChange: (date) {
                  print(date);
                },
              ),
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  mytimeLineTile(
                      isPast: true, size: size, isFirst: true, isLast: false),
                  mytimeLineTile(
                      isPast: true, size: size, isFirst: false, isLast: false),
                  mytimeLineTile(
                      isPast: false, size: size, isFirst: false, isLast: false),
                  mytimeLineTile(
                      isPast: false, size: size, isFirst: false, isLast: false),
                  mytimeLineTile(
                      isPast: false, size: size, isFirst: false, isLast: false),
                  mytimeLineTile(
                      isPast: false, size: size, isFirst: false, isLast: false),
                  mytimeLineTile(
                      isPast: false, size: size, isFirst: false, isLast: false),
                  mytimeLineTile(
                      isPast: false, size: size, isFirst: false, isLast: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
