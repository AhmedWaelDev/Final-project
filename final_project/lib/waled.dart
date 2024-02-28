import 'package:flutter/material.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xffe5e9f0),
        appBar: AppBar(
          elevation: 0,
          title: const Center(
              child: Text(
            "Appointment",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          )),
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              // تغيير لون خلفية الدائرة إلى الأبيض
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                color: Colors.black, // تغيير لون الأيقونة
                onPressed: () {
                  Navigator.of(context).pop(); // للرجوع للشاشة السابقة
                },
              ),
            ),
          ),

          backgroundColor: const Color(0xffe5e9f0),
          // shadowColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 35 / 430,
                  right: size.width * 35 / 430,
                  top: size.height * 10 / 932),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            color: _selectedIndex == 0
                                ? Colors.cyan
                                : Colors.white,
                            child: TextButton(
                              child: Text(
                                "Upcoming",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 18 / 430,
                                  color: _selectedIndex == 0
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            color: _selectedIndex == 1
                                ? Colors.cyan
                                : Colors.white,
                            child: TextButton(
                              child: Text(
                                "Complete",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 18 / 430,
                                  color: _selectedIndex == 1
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Container(
                            color: _selectedIndex == 2
                                ? Colors.cyan
                                : Colors.white,
                            child: TextButton(
                              child: Text(
                                "Cancelled",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 18 / 430,
                                  color: _selectedIndex == 2
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 32 / 932,
          ),
          if (_selectedIndex == 0)
            SizedBox(
              width: size.width * 360 / 430,
              child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    DoctorCard(
                      name: " DR Noha",
                      rating: 3.5,
                      specialty: "Pediatricain",
                      onChatPressed: () {},
                      onVideoCallPressed: () {},
                      video: 'Video call',
                    ),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    DoctorCard(
                      name: " DR Memo",
                      rating: 4,
                      specialty: "Pediatricain",
                      onChatPressed: () {},
                      onVideoCallPressed: () {},
                      video: 'Video call',
                    )
                  ]),
            )
          else if (_selectedIndex == 1)
            SizedBox(
              width: size.width * 360 / 430,
              child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    cardComplete(
                        name: "Dr.Sara",
                        rating: 2.5,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.nermin",
                        rating: 4.5,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.asmaa",
                        rating: 2.6,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.yomna",
                        rating: 2.7,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.yassmin",
                        rating: 3.4,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.Sara",
                        rating: 3.2,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.nada",
                        rating: 3.8,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                      name: "Dr. Ahmed",
                      rating: 3.8,
                      specialty: "Dermatologist",
                      onChatPressed: () {},
                      onVideoCallPressed: () {},
                    ),
                    SizedBox(height: size.height * 19 / 932),
                  ]),
            )
          else if (_selectedIndex == 2)
            SizedBox(
              width: size.width * 360 / 430,
              child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    cardComplete(
                        name: "Dr.yassmin",
                        rating: 3.4,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.Sara",
                        rating: 3.2,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.nada",
                        rating: 3.8,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                      name: "Dr. Ahmed",
                      rating: 3.8,
                      specialty: "Dermatologist",
                      onChatPressed: () {},
                      onVideoCallPressed: () {},
                    ),
                    SizedBox(height: size.height * 19 / 932),
                    cardComplete(
                        name: "Dr.Sara",
                        rating: 2.5,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.nermin",
                        rating: 4.5,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.asmaa",
                        rating: 2.6,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                    cardComplete(
                        name: "Dr.yomna",
                        rating: 2.7,
                        specialty: "Pediatricain",
                        onChatPressed: () {},
                        onVideoCallPressed: () {}),
                    SizedBox(
                      height: size.height * 19 / 932,
                    ),
                  ]),
            )
        ])));
  }
}

/*

class TapBar2 extends StatefulWidget {

  final  String text;
  final  int index;
  const TapBar2({super.key, required this.text, required this.index});


  @override
  State<TapBar2> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return   Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(borderRadius:  BorderRadius.circular(25) ,
        child: Container(  color:  _selectedIndex == widget.index ?  Colors.cyan: Colors.white ,
          child: TextButton(child: Text(widget.text, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size.width * 20 / 430,
            color: _selectedIndex == widget.index? Colors.white : Colors.black,),),
            onPressed: () {
              setState(() {_selectedIndex = widget.index;});},),),),
    );

  }
}

*/

class DoctorCard extends StatelessWidget {
  final String name;
  final double rating;
  final String specialty;
  final VoidCallback onChatPressed;
  final VoidCallback onVideoCallPressed;
  final String video;

  const DoctorCard({
    super.key,
    required this.name,
    required this.rating,
    required this.specialty,
    required this.onChatPressed,
    required this.onVideoCallPressed,
    required this.video,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
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
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/dr.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بالطبيب
                        radius: 25, // تحديد حجم الصورة
                      ),
                      SizedBox(
                          width: size.width *
                              10 /
                              430), // مسافة بين الصورة وبقية المعلومات
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
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
                              Text(rating.toString()),
                              SizedBox(width: size.width * 25 / 430),

                              // SizedBox(height: 8),
                              Text(
                                specialty,
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
                            onPressed: onChatPressed,
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
                            color: const Color(0xffa9ecf8),
                            onPressed: onChatPressed,
                            child: Row(
                              children: [
                                Icon(Icons.videocam_outlined,
                                    size: size.width * 28 / 430,
                                    color: const Color(
                                      0xff50B7C5,
                                    )),
                                Text(
                                  video,
                                  style: TextStyle(
                                      fontSize: size.width * 18 / 430,
                                      color: const Color(
                                        0xff50B7C5,
                                      )),
                                ),
                              ],
                            ),
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
    );
  }
}

class cardComplete extends StatefulWidget {
  final String name;
  final double rating;
  final String specialty;
  final VoidCallback onChatPressed;
  final VoidCallback onVideoCallPressed;

  const cardComplete({
    super.key,
    required this.name,
    required this.rating,
    required this.specialty,
    required this.onChatPressed,
    required this.onVideoCallPressed,
  });

  @override
  State<cardComplete> createState() => _cardCompleteState();
}

class _cardCompleteState extends State<cardComplete> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
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
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/dr.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بالطبيب
                        radius: 25, // تحديد حجم الصورة
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
                            onPressed: widget.onChatPressed,
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
    );
  }
}
