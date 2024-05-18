import 'package:final_project/medicine%20reminder/reminder.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/screensappbar.dart';
import '../roomDB/DatabaseHelper.dart';

class EditMedicine extends StatefulWidget {
  final String selectedicon;
  final String name;
  final String breakfast;
  final String lunch;
  final String dinner;
  final int amount;
  final int duration;
  final String cause;
  final int capSize;
  final int id;
  const EditMedicine(
      {Key? key,
      required this.selectedicon,
      required this.name,
      required this.breakfast,
      required this.lunch,
      required this.dinner,
      required this.amount,
      required this.duration,
      required this.cause,
      required this.capSize,
      required this.id})
      : super(key: key);

  @override
  State<EditMedicine> createState() => EditMedicineState();
}

class EditMedicineState extends State<EditMedicine> {
  DatabaseHelper dbHelper = DatabaseHelper();
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
            const screensappbar(name: "Medicine Reminder"),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: size.width * 0.5, // Adjust width as needed
                      height: size.height * 0.3, // Adjust height as needed
                      child: Image.asset(widget.selectedicon),
                    ),
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: size.height * 34 / 932),
                  ),
                  SizedBox(
                    height: size.height * 20 / 932,
                  ),
                  Text(
                    "time",
                    style: TextStyle(
                        fontSize: size.height * 20 / 932,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 20 / 932,
                  ),
                  Row(
                    children: <Widget>[
                      widget.breakfast == ""
                          ? const SizedBox()
                          : Container(
                              padding: EdgeInsets.all(size.height * 10 / 932),
                              margin: EdgeInsets.symmetric(
                                  vertical: size.height * 5 / 932),
                              height: size.height * 60 / 932,
                              width: size.width * 90 / 320,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffEBC6D9),
                              ),
                              child: FittedBox(
                                child: Text(
                                  widget.breakfast,
                                  style: const TextStyle(
                                      color: Color(0xffE25392),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: size.width * 5 / 932,
                      ),
                      widget.lunch == ""
                          ? const SizedBox()
                          : Container(
                              padding: EdgeInsets.all(size.height * 10 / 932),
                              margin: EdgeInsets.symmetric(
                                  vertical: size.height * 5 / 932),
                              height: size.height * 60 / 932,
                              width: size.width * 90 / 320,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffCFE1E7),
                              ),
                              child: FittedBox(
                                child: Text(
                                  widget.lunch,
                                  style: const TextStyle(
                                      color: Color(0xff3C93AD),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                      SizedBox(
                        width: size.width * 5 / 932,
                      ),
                      widget.dinner == ""
                          ? const SizedBox()
                          : Container(
                              padding: EdgeInsets.all(size.height * 10 / 932),
                              margin: EdgeInsets.symmetric(
                                  vertical: size.height * 5 / 932),
                              height: size.height * 60 / 932,
                              width: size.width * 90 / 320,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color(0xffDBDAF0),
                              ),
                              child: FittedBox(
                                child: Text(
                                  widget.dinner,
                                  style: const TextStyle(
                                      color: Color(0xff8C86DD),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 35 / 932,
                  ),
                  Text(
                    "Detials",
                    style: TextStyle(
                        fontSize: size.height * 20 / 932,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 20 / 932,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(size.height * 5 / 932),
                        height: size.height * 100 / 932,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff3C93AD))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Amount",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.amount} pill/day",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    color: const Color(0xff3C93AD)),
                              ),
                            ]),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(size.height * 5 / 932),
                        height: size.height * 100 / 932,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xffF7A132))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Durations",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.duration} day",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    color: const Color(0xffF7A132)),
                              ),
                            ]),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(size.height * 5 / 932),
                        height: size.height * 100 / 932,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xffD33377))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "cause",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.cause,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    color: const Color(0xffD33377)),
                              ),
                            ]),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(size.height * 5 / 932),
                        height: size.height * 100 / 932,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff9089DF))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Cap Size",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${widget.capSize} mg",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: size.height * 18 / 932,
                                    color: const Color(0xff9089DF)),
                              ),
                            ]),
                      )),
                    ],
                  ),
                  Center(
                    child: Container(
                      height: size.height * 80 / 932,
                      width: double.infinity,
                      margin: EdgeInsets.all(size.height * 20 / 932),
                      child: MaterialButton(
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onPressed: () async {
                          await dbHelper.deleteMedicine(widget.id);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Center(
                                child: Text("medicine deleted successfully")),
                            duration: Duration(seconds: 3),
                          ));
                          Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const myReminder(),
                              ),
                            );
                          });
                        },
                        color: const Color(0xffE25392),
                        child: Text("Remove",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 25 / 932)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
