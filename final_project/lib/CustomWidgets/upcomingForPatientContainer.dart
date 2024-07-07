import 'package:final_project/models/Helper.dart';
import 'package:flutter/material.dart';

class upcomingForPatientContainer extends StatelessWidget {
  const upcomingForPatientContainer({
    super.key,
    required this.doctorName,
    required this.startTime,
    required this.startDate,
    required this.status,
    required this.image,
  });
  final String doctorName;
  final String startTime;
  final String startDate;
  final int status;
  final String image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.all(
          size.height * 20 / 932,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 20 / 932),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.height * 90 / 932,
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
                        SizedBox(
                          width: size.height * 20 / 932,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              doctorName,
                              style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              startDate,
                              style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  color: const Color(0xff757575)),
                            ),
                            Text(
                              startTime,
                              style: TextStyle(
                                  fontSize: size.height * 20 / 932,
                                  color: const Color(0xff757575)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Row(
                        children: [
                          Container(
                            height: size.height * 15 / 932,
                            width: size.height * 15 / 932,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: status == 2
                                    ? const Color(0xff757575)
                                    : Colors.green),
                          ),
                          SizedBox(
                            width: size.height * 10 / 932,
                          ),
                          Expanded(
                            child: Text(
                              calculateRemainingTime(startDate, startTime),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: size.height * 15 / 932,
                                  color: const Color(0xff757575)),
                            ),
                          )
                        ],
                      )),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              width: size.width * 100 / 320,
                              height: size.height * 50 / 932,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF50B7C5),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(size.height * 25 / 932))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.video_camera_front_rounded,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Join Call",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.height * 15 / 932),
                                  )
                                ],
                              )),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
