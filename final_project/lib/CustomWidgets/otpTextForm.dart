import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextFormField extends StatelessWidget {
  const OtpTextFormField(
      {Key? key,
      required this.otp1,
      required this.otp2,
      required this.otp3,
      required this.otp4,
      required this.otp5,
      required this.otp6})
      : super(key: key);

  final TextEditingController otp1;
  final TextEditingController otp2;
  final TextEditingController otp3;
  final TextEditingController otp4;
  final TextEditingController otp5;
  final TextEditingController otp6;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width:
                  size.width * 40 / 320, // Adjusted width based on screen size
              child: TextFormField(
                controller: otp1,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width:
                  size.width * 40 / 320, // Adjusted width based on screen size
              child: TextFormField(
                controller: otp2,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width:
                  size.width * 40 / 320, // Adjusted width based on screen size
              child: TextFormField(
                controller: otp3,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width:
                  size.width * 40 / 320, // Adjusted width based on screen size
              child: TextFormField(
                controller: otp4,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width:
                  size.width * 40 / 320, // Adjusted width based on screen size
              child: TextFormField(
                controller: otp5,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              width:
                  size.width * 40 / 320, // Adjusted width based on screen size
              child: TextFormField(
                controller: otp6,
                onChanged: (value) {
                  if (value.length == 1) {
                    // If it's the last field, hide the keyboard
                    FocusScope.of(context).unfocus();
                  } else {
                    FocusScope.of(context).nextFocus();
                  }
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [LengthLimitingTextInputFormatter(1)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
