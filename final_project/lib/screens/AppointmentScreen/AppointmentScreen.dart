import 'package:flutter/material.dart';

import '../../CustomWidgets/DoctorCard.dart';
import '../../CustomWidgets/cardComplete.dart';

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
          title: Padding(
            padding: EdgeInsets.only(
              top: size.width * 20 / 320,
            ),
            child: const Center(
                child: Text(
              "Appointment",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
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
                  top: size.height * 20 / 932),
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