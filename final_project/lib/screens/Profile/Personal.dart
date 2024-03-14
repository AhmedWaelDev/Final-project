import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: const Color(0xffe5e9f0),
        padding: EdgeInsets.only(
            top: size.width * 35 / 320,
            right: size.width * 10 / 320,
            left: size.width * 10 / 320),
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  minWidth: size.height * 40 / 932,
                  height: size.height * 40 / 932,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(size.height * 13 / 932),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  "Personal Information",
                  style: TextStyle(
                      fontSize: size.height * 25 / 932,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
            SizedBox(height: size.height * 10 / 932),
            Expanded(
              child: SingleChildScrollView(
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
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
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
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
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
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
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
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
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
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
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
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
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
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
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
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
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
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
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
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
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
                            style: TextStyle(
                                color: Color(0xff757575), fontSize: 16),
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
                          suffixStyle:
                              const TextStyle(color: Color(0xffB2AAAA)),
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
                      height: size.height * 20 / 932,
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
          ],
        ),
      ),
    );
  }
}
