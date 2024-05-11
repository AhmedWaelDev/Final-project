import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../medicine reminder/editMedicine.dart';

class ReminderTimelineTile extends StatefulWidget {
  const ReminderTimelineTile({
    Key? key,
    required this.isPast,
    required this.size,
    required this.isFirst,
    required this.isLast,
    required this.selectedphoto,
    required this.breakfastTime,
    required this.lunchTime,
    required this.dinnerTime,
    required this.medicineName,
    required this.id,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.cause,
    required this.capSize,
    required this.amount,
    required this.duration,
  }) : super(key: key);

  final bool isPast;
  final Size size;
  final bool isFirst;
  final bool isLast;
  final String selectedphoto;
  final String breakfastTime;
  final String lunchTime;
  final String dinnerTime;
  final String medicineName;
  final int id;
  final String breakfast;
  final String lunch;
  final String dinner;
  final String cause;
  final int capSize;
  final int amount;
  final int duration;

  @override
  State<ReminderTimelineTile> createState() => _ReminderTimelineTileState();
}

class _ReminderTimelineTileState extends State<ReminderTimelineTile> {
  bool mydata = false;

  @override
  void initState() {
    super.initState();
    // Perform initialization here
  }

  @override
  Widget build(BuildContext context) {
    Widget timewidget;

    if (widget.breakfastTime != "") {
      timewidget = Text(widget.breakfastTime);
    } else if (widget.lunchTime != "") {
      timewidget = Text(widget.lunchTime);
    } else {
      timewidget = Text(widget.dinnerTime);
    }

    return SizedBox(
      height: widget.size.height * 250 / 932, // Adjust this height as needed
      child: TimelineTile(
        isFirst: widget.isFirst,
        isLast: widget.isLast,
        beforeLineStyle: LineStyle(
          color: widget.isPast == true ? const Color(0xFF50B7C5) : Colors.grey,
        ),
        indicatorStyle: IndicatorStyle(
          width: widget.size.width * 40 / 320,
          iconStyle: widget.isPast == true
              ? IconStyle(iconData: Icons.done, color: Colors.white)
              : null,
          color: widget.isPast == true ? const Color(0xFF50B7C5) : Colors.grey,
        ),
        endChild: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: widget.size.height * 5 / 932),
                child: timewidget),
            Flexible(
              child: Container(
                  margin: EdgeInsets.all(widget.size.width * 10 / 320),
                  padding: EdgeInsets.all(widget.size.width * 20 / 320),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditMedicine(
                                  id: widget.id,
                                  amount: widget.amount,
                                  capSize: widget.capSize,
                                  cause: widget.cause,
                                  duration: widget.duration,
                                  breakfast: widget.breakfast,
                                  dinner: widget.dinner,
                                  lunch: widget.lunch,
                                  selectedicon: widget.selectedphoto,
                                  name: widget.medicineName,
                                )),
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          Image.asset(widget.selectedphoto),
                          SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                FittedBox(
                                  child: Text(
                                    widget.medicineName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                widget.breakfast == ""
                                    ? const SizedBox()
                                    : Container(
                                        padding: EdgeInsets.all(
                                            widget.size.height * 5 / 932),
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                widget.size.height * 5 / 932),
                                        height: widget.size.height * 30 / 932,
                                        width: widget.size.width * 90 / 320,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
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
                                widget.lunch == ""
                                    ? const SizedBox()
                                    : Container(
                                        padding: EdgeInsets.all(
                                            widget.size.height * 5 / 932),
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                widget.size.height * 5 / 932),
                                        height: widget.size.height * 30 / 932,
                                        width: widget.size.width * 90 / 320,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
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
                                widget.dinner == ""
                                    ? const SizedBox()
                                    : Container(
                                        padding: EdgeInsets.all(
                                            widget.size.height * 5 / 932),
                                        margin: EdgeInsets.symmetric(
                                            vertical:
                                                widget.size.height * 5 / 932),
                                        height: widget.size.height * 30 / 932,
                                        width: widget.size.width * 90 / 320,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
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
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
            // Add more widgets to the Row as needed
          ],
        ),
      ),
    );
  }
}
