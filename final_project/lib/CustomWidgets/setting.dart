import 'package:flutter/material.dart';

class TextSetting extends StatelessWidget {
  final String teext;
  IconData currentIcon;

  TextSetting({
    super.key,
    required this.teext,
    required this.currentIcon,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: size.width * 370 / 430,
          height: size.height * 80 / 932,
          color: Color(0xffe5e9f0),
          child: Container(
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(currentIcon),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        teext,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 100 / 430,
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_right_sharp)),
              ],
            ),
          ),
        ),

        // child: TextButton(onPressed: () {  }, child: Text(teext,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,),),),
      ),
    );
  }
}
