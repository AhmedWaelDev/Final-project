import 'package:flutter/material.dart';

class doctorAppointContainer extends StatelessWidget {
  const doctorAppointContainer(
      {super.key,
      this.name,
      this.age,
      required this.onChatPressed,
      required this.onvedioPressed});
  final String? name;
  final String? age;
  final VoidCallback onChatPressed;
  final VoidCallback onvedioPressed;

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
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: size.height * 30 / 932,
          foregroundImage: const AssetImage("assets/images/dr.jpg"),
        ),
        title: Text(
          name == null ? "unkown" : name!,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            fontSize: size.height * 20 / 932,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          InkWell(
            onTap: onChatPressed,
            child: Container(
              height: size.height * 40 / 932,
              width: size.height * 50 / 932,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height * 15 / 932),
                  color: const Color(0xff7269D2)),
              child: const Icon(
                Icons.chat_outlined,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 5 / 932,
          ),
          InkWell(
            onTap: onvedioPressed,
            child: Container(
              height: size.height * 40 / 932,
              width: size.height * 50 / 932,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height * 15 / 932),
                  color: const Color(0xFF50B7C5)),
              child: const Icon(
                Icons.call_outlined,
                color: Colors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
