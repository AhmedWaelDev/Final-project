import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class getAppointmentOtherDoctors extends StatelessWidget {
  const getAppointmentOtherDoctors({
    super.key,
    required this.size,
    required this.name,
    required this.speciality,
    required this.rate,
    this.function,
    required this.image,
  });

  final Size size;
  final String name;
  final String image;
  final String speciality;
  final String rate;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.height * 20 / 932,
              vertical: size.height * 5 / 932),
          padding: EdgeInsets.all(size.height * 10 / 932),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(
                  width: size.width * 50 / 320,
                  height: size.width * 50 / 320,
                  child: ClipOval(
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback to default image if there's an error
                        return Image.asset(
                          'assets/images/default-avatar.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 25 / 932,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 90 / 320,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: size.height * 19 / 932,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis, // Handle overflow
                      ),
                    ),
                    Text(
                      speciality,
                      style: TextStyle(
                          fontSize: size.height * 17 / 932, color: Colors.grey),
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      rate.toString(),
                      style: TextStyle(
                        fontSize: size.height * 20 / 932,
                        color: Colors.grey,
                      ),
                    ),
                    RatingBarIndicator(
                      rating: double.parse(rate),
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
          )),
    );
  }
}
