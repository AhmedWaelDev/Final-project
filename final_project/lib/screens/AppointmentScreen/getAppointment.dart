import 'package:final_project/CustomWidgets/getAppointmentOtherDoctors.dart';
import 'package:final_project/CustomWidgets/screensappbar.dart';
import 'package:final_project/screens/AppointmentScreen/appointmentReservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GetAppointment extends StatelessWidget {
  const GetAppointment({super.key});

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
            const screensappbar(name: "Appointment"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 25 / 932,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 20 / 932),
                      padding: EdgeInsets.all(size.height * 20 / 932),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color(0xff050b7c5)
                              .withAlpha((255 * 0.07).toInt())),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '+150',
                                      style: TextStyle(
                                        fontSize: size.height * 19 / 932,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'patients',
                                      style: TextStyle(
                                        fontSize: size.height * 16 / 932,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 30 / 932,
                                child: const VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 2,
                                  width: 20,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '10 years',
                                      style: TextStyle(
                                        fontSize: size.height * 19 / 932,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Experience',
                                      style: TextStyle(
                                        fontSize: size.height * 16 / 932,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: size.height * 30 / 932,
                                child: const VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 1,
                                  width: 20,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '3.5',
                                      style: TextStyle(
                                        fontSize: size.height * 19 / 932,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Rating',
                                      style: TextStyle(
                                        fontSize: size.height * 16 / 932,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.symmetric(
                          horizontal: size.height * 20 / 932),
                      padding: EdgeInsets.all(size.height * 20 / 932),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: const Color(0xff050b7c5)
                            .withAlpha((255 * 0.07).toInt()),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '5',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 60 / 932,
                              color: Colors.black,
                            ),
                          ),
                          RatingBarIndicator(
                            rating: 3.5,
                            itemSize: 20,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                          ),
                          SizedBox(
                            height: size.height * 10 / 932,
                          ),
                          Text(
                            '(2315)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height * 20 / 932,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 20 / 932,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return getAppointmentOtherDoctors(size: size);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.height * 20 / 932,
                  vertical: size.height * 20 / 932),
              width: size.width,
              child: MaterialButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const appointmentReservation()),
                  );
                },
                color: const Color(0xFF50B7C5),
                child: const Text("Add appointment",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
