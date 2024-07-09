import 'package:flutter/material.dart';

class cardComplete extends StatefulWidget {
  final String name;
  final String rating;
  final String specialty;
  final String image;
  final VoidCallback onChatPressed;
  final VoidCallback onVideoCallPressed;

  const cardComplete({
    super.key,
    required this.name,
    required this.rating,
    required this.specialty,
    required this.onChatPressed,
    required this.onVideoCallPressed,
    required this.image,
  });

  @override
  State<cardComplete> createState() => _cardCompleteState();
}

class _cardCompleteState extends State<cardComplete> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 10 / 932),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          color: Colors.white,
          width: size.width * 365 / 430,
          height: size.height * 170 / 932,
          child: Padding(
            padding: EdgeInsets.only(
              left: size.width * 5 / 430,
              right: size.width * 5 / 430,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Padding(
                padding: EdgeInsets.only(
                    left: size.width * 16 / 430, top: size.height * 15 / 932),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 60 / 932,
                          width: size.height * 60 / 932,
                          child: ClipOval(
                            child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                // Fallback to default image if there's an error
                                return Image.asset(
                                  'assets/images/default-avatar.jpg',
                                  fit: BoxFit.cover,
                                );
                              },
                            ), // تغيير المسار إلى مسار الصورة الخاصة بالطبيب
                          ),
                        ),
                        SizedBox(
                            width: size.width *
                                10 /
                                430), // مسافة بين الصورة وبقية المعلومات
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: size.width * 16 / 430,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: size.height * 16 / 932),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: size.width * 5 / 430),
                                Text(widget.rating.toString()),
                                SizedBox(width: size.width * 25 / 430),

                                // SizedBox(height: 8),
                                Text(
                                  widget.specialty,
                                  style: TextStyle(
                                    fontSize: size.width * 14 / 430,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 26 / 932,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: const Color(0x94b6b2b2),
                            width: size.width * 151 / 430,
                            height: size.height * 40 / 932,
                            child: MaterialButton(
                              color: const Color(0xffc5c4c4),
                              onPressed: widget.onChatPressed,
                              child: Row(
                                children: [
                                  Icon(Icons.chat_outlined,
                                      size: size.width * 20 / 430,
                                      color: const Color(
                                        0xff757575,
                                      )),
                                  SizedBox(
                                    width: size.width * 7 / 430,
                                  ),
                                  Text(
                                    'Open Chat',
                                    style: TextStyle(
                                        fontSize: size.width * 17 / 430,
                                        color: const Color(
                                          0xff757575,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 29 / 430,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            color: const Color(0xff50B7C5),
                            width: size.width * 150 / 430,
                            height: size.height * 40 / 932,
                            child: MaterialButton(
                              color: const Color(
                                0xff50B7C5,
                              ),
                              onPressed: widget.onVideoCallPressed,
                              child: Center(
                                  child: Text(
                                "Rebooking",
                                style: TextStyle(
                                    fontSize: size.width * 20 / 430,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
