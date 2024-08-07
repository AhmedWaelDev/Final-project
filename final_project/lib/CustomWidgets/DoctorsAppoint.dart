import 'package:flutter/material.dart';

class DoctorsAppoint extends StatefulWidget {
  final String name;
  final String rating;
  final String specialty;
  final String image;
  final VoidCallback onChatPressed;

  const DoctorsAppoint({
    super.key,
    required this.name,
    required this.rating,
    required this.specialty,
    required this.onChatPressed,
    required this.image,
  });

  @override
  State<DoctorsAppoint> createState() => _cardCompleteState();
}

class _cardCompleteState extends State<DoctorsAppoint> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(
        size.height * 10 / 932,
      ),
      margin: EdgeInsets.only(
        bottom: size.height * 15 / 932,
        left: size.height * 15 / 932,
        right: size.height * 15 / 932,
      ),
      height: size.height * 100 / 932,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(size.height * 25 / 932)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                width: size.width * 10 / 932,
              ),
              Column(
                children: [
                  SizedBox(
                    width: size.width * 90 / 320,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: size.width * 16 / 430,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 10 / 932),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      SizedBox(width: size.width * 3 / 430),
                      Text(
                        widget.rating,
                      ),
                      SizedBox(width: size.width * 8 / 430),
                      SizedBox(
                        width: size.width * 80 / 430,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          widget.specialty,
                          style: TextStyle(
                            fontSize: size.width * 14 / 430,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 5 / 430,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: const Color(0xff50B7C5),
              width: size.width * 120 / 430,
              height: size.height * 40 / 932,
              child: MaterialButton(
                color: const Color(
                  0xff50B7C5,
                ),
                onPressed: widget.onChatPressed,
                child: Center(
                    child: Text(
                  "Book Now",
                  style: TextStyle(
                      fontSize: size.width * 16 / 430, color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
