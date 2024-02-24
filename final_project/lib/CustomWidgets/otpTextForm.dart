import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class otpTextForm extends StatelessWidget {
  const otpTextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 50 / 320,
        child: TextFormField(
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
                  borderSide: BorderSide.none)),
          keyboardType: TextInputType.number,
          inputFormatters: [LengthLimitingTextInputFormatter(1)],
        ));
  }
}
