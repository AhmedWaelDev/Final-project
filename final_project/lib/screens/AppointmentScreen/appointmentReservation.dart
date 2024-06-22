import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class appointmentReservation extends StatefulWidget {
  const appointmentReservation({Key? key}) : super(key: key);

  @override
  _AppointmentReservationState createState() => _AppointmentReservationState();
}

class _AppointmentReservationState extends State<appointmentReservation> {
  int _selectedTimeIndex = -1; // To track the selected chip index

  // List of times for the ChoiceChips
  final List<String> _times = [
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "1:00 PM",
    "2:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const bgColor = Color(0xffe5e9f0);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: size.width * 35 / 320,
          right: size.width * 10 / 320,
          left: size.width * 10 / 320,
        ),
        height: size.height,
        width: size.width,
        color: bgColor,
        child: Column(
          children: [
            AppBar(
              title: const Text("Appointment"),
              backgroundColor: Colors.white, // Customize app bar color
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: size.height * 20 / 932,
                      ),
                      padding: EdgeInsets.all(size.height * 20 / 932),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff050b7c5)
                            .withAlpha((255 * 0.07).toInt()),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClipOval(
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1575936123452-b67c3203c357?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D',
                                  width: size.width * 100 / 320,
                                  height: size.width * 100 / 320,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 20 / 320,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dr. Kawsar Ahmed',
                                      style: TextStyle(
                                        fontSize: size.height * 19 / 932,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'Cardiologist',
                                      style: TextStyle(
                                        fontSize: size.height * 16 / 932,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      'United State Hospital',
                                      style: TextStyle(
                                        fontSize: size.height * 16 / 932,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 40 / 932),
                        ],
                      ),
                    ),
                    Text(
                      'Select Date',
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: size.height * 150 / 932,
                      child: DatePicker(
                        DateTime.now(),
                        height: size.height * 100 / 932,
                        width: size.width * 60 / 320,
                        initialSelectedDate: DateTime.now(),
                        dayTextStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        selectionColor: const Color(0xFF50B7C5),
                        onDateChange: (date) {},
                      ),
                    ),
                    SizedBox(height: size.height * 20 / 932),
                    Text(
                      'Select Time',
                      style: TextStyle(
                          fontSize: size.height * 20 / 932,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: List.generate(_times.length, (index) {
                        return ChoiceChip(
                          label: Text(
                            _times[index],
                            style: TextStyle(
                              color: _selectedTimeIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          selected: _selectedTimeIndex == index,
                          onSelected: (selected) {
                            setState(() {
                              _selectedTimeIndex = selected ? index : -1;
                            });
                          },
                          selectedColor: const Color(0xFF50B7C5),
                          labelStyle: const TextStyle(color: Colors.white),
                          backgroundColor: Colors.transparent,
                          selectedShadowColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        );
                      }),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 20 / 932,
                          vertical: size.height * 60 / 932),
                      width: size.width,
                      child: MaterialButton(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () {
                          // Handle booking appointment
                        },
                        color: const Color(0xFF50B7C5),
                        child: const Text(
                          "Book appointment",
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
