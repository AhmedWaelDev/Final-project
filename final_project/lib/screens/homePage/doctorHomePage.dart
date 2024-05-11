import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../CustomWidgets/appBar.dart';
import '../../CustomWidgets/doctorAppointmentContainer.dart';
import '../../CustomWidgets/timeLIneListTile.dart';
import '../../customers/patient.dart';
import '../AppointmentScreen/doctorAppointment.dart';

class doctorHomePage extends StatelessWidget {
  const doctorHomePage({super.key});

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
        child: Column(
          children: [
            const myAppBar(
              name: "Jenifer",
              isDoctor: true,
              image: 'assets/images/person.png',
            ),
            SizedBox(
              height: size.height * 20 / 932,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Your Appointment",
                            style: TextStyle(
                                fontSize: size.height * 20 / 932,
                                fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const doctorAppointment()),
                            );
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                              fontSize: size.height * 20 / 932,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                      child: DatePicker(
                        DateTime.now(),
                        height: size.height * 100 / 932,
                        width: size.width * 60 / 320,
                        initialSelectedDate: DateTime.now(),
                        daysCount: 10,
                        dayTextStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        selectionColor: const Color(0xFF50B7C5),
                        onDateChange: (date) {
                          print(date);
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.35,
                      child: ListView(
                        children: [
                          doctorTimeLineTile(
                              isPast: true,
                              size: size,
                              isFirst: true,
                              isLast: false),
                          doctorTimeLineTile(
                              isPast: true,
                              size: size,
                              isFirst: false,
                              isLast: false),
                          doctorTimeLineTile(
                              isPast: false,
                              size: size,
                              isFirst: false,
                              isLast: false),
                          doctorTimeLineTile(
                              isPast: false,
                              size: size,
                              isFirst: false,
                              isLast: true),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 10 / 932,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Your patients",
                          style: TextStyle(
                              fontSize: size.height * 25 / 932,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Patient()),
                              );
                            },
                            child: Text(
                              "See all",
                              style:
                                  TextStyle(fontSize: size.height * 20 / 932),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 10 / 320,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const doctorAppointContainer();
                      },
                    )
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
