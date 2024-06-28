import 'package:final_project/models/Helper.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class doctorTimeLineTile extends StatelessWidget {
  const doctorTimeLineTile({
    super.key,
    required this.isPast,
    required this.size,
    required this.isFirst,
    required this.isLast,
    this.name,
    this.startTIme,
    this.age,
  });

  final bool isPast;
  final Size size;
  final bool isFirst;
  final bool isLast;
  final String? name;
  final String? startTIme;
  final String? age;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 200 / 932,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast == true ? const Color(0xFF50B7C5) : Colors.grey),
        indicatorStyle: IndicatorStyle(
            width: size.width * 40 / 320,
            iconStyle: isPast == true
                ? IconStyle(iconData: Icons.done, color: Colors.white)
                : null,
            color: isPast == true ? const Color(0xFF50B7C5) : Colors.grey),
        endChild: Container(
          height: size.height * 150 / 932,
          margin: EdgeInsets.all(size.width * 10 / 320),
          padding: EdgeInsets.all(size.width * 20 / 320),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isPast == true ? const Color(0xFF50B7C5) : Colors.white),
          child: ListTile(
            leading: CircleAvatar(
              radius: size.height * 30 / 932,
              foregroundImage: const AssetImage("assets/images/dr.jpg"),
            ),
            title: Text(
              name ?? "unknown",
              style: TextStyle(
                  fontSize: size.height * 20 / 932,
                  fontWeight: FontWeight.bold,
                  color: isPast == true ? Colors.white : Colors.black),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${calculateAge(age)} years old",
                  style: TextStyle(
                      color: isPast == true ? Colors.white : Colors.black),
                ),
                Text(
                  "$startTIme",
                  style: TextStyle(
                      color: isPast == true ? Colors.white : Colors.black),
                ),
              ],
            ),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
