import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffe5e9f0),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Personal Information",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),

          leading: Padding(
            padding: const EdgeInsets.only(
              left: 15.5,
            ),
            child: CircleAvatar(
              backgroundColor:
                  Colors.white, // تغيير لون خلفية الدائرة إلى الأبيض
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
          child: Column(
            children: <Widget>[
//First Name

              SizedBox(
                height: size.height * 10 / 932,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 48 / 430),
                child: const Row(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    )
                  ],
                ),
              ),

              // SizedBox(height: size.height*5/932,),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 52 / 430,
                    right: size.width * 52 / 430,
                    top: size.height * 12 / 932),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your name",
                    suffixStyle: const TextStyle(color: Color(0xffB2AAAA)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 5 / 932,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 48 / 430),
                child: const Row(
                  children: [
                    Text(
                      "Data of birth",
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    )
                  ],
                ),
              ),

              //  SizedBox(height: size.height*5/932,),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 52 / 430,
                    right: size.width * 52 / 430,
                    top: size.height * 12 / 932),
                child: TextFormField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: "Enter your birth data ",
                    suffixStyle: const TextStyle(color: Color(0xffB2AAAA)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 5 / 932,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 48 / 430),
                child: const Row(
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    )
                  ],
                ),
              ),

              //  SizedBox(height: size.height*5/932,),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 52 / 430,
                    right: size.width * 52 / 430,
                    top: size.height * 12 / 932),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your gender",
                    suffixStyle: const TextStyle(color: Color(0xffB2AAAA)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 5 / 932,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 48 / 430),
                child: const Row(
                  children: [
                    Text(
                      "Blood groub",
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    )
                  ],
                ),
              ),

              // SizedBox(height: size.height*5/932,),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 52 / 430,
                    right: size.width * 52 / 430,
                    top: size.height * 12 / 932),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Enter your blood groub",
                    suffixStyle: const TextStyle(color: Color(0xffB2AAAA)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 5 / 932,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 48 / 430),
                child: const Row(
                  children: [
                    Text(
                      "Phone number",
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    )
                  ],
                ),
              ),

              //  SizedBox(height: size.height*5/932,),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 52 / 430,
                    right: size.width * 52 / 430,
                    top: size.height * 12 / 932),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter your phone number",
                    suffixStyle: const TextStyle(color: Color(0xffB2AAAA)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height * 5 / 932,
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width * 48 / 430),
                child: const Row(
                  children: [
                    Text(
                      "E-mail",
                      style: TextStyle(color: Color(0xff757575), fontSize: 16),
                    )
                  ],
                ),
              ),

              // SizedBox(height: size.height*5/932,),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * 52 / 430,
                    right: size.width * 52 / 430,
                    top: size.height * 12 / 932),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    suffixStyle: const TextStyle(color: Color(0xffB2AAAA)),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),

              //Button

              SizedBox(
                height: size.height * 100 / 932,
              ),
              SizedBox(
                width: size.width * 330 / 430,
                height: size.height * 50 / 932,
                child: MaterialButton(
                  onPressed: () {},
                  color: const Color(0xff50b7c5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
