import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class getAppointmentOtherDoctors extends StatelessWidget {
  const getAppointmentOtherDoctors({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.height * 20 / 932,
            vertical: size.height * 5 / 932),
        padding: EdgeInsets.all(size.height * 10 / 932),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/images/drchat2.png',
                  width: 60.0,
                  height: 60.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: size.width * 25 / 932,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr. Kawsar Ahmed',
                    style: TextStyle(
                      fontSize: size.height * 19 / 932,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  Text(
                    'Cardiologist',
                    style: TextStyle(
                        fontSize: size.height * 17 / 932, color: Colors.grey),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '3.5',
                    style: TextStyle(
                      fontSize: size.height * 20 / 932,
                      color: Colors.grey,
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
                ],
              )
            ],
          ),
        ));
  }
}
