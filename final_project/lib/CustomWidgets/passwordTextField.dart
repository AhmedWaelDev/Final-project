import 'package:flutter/material.dart';

class passwordTextField extends StatelessWidget {
  const passwordTextField({
    super.key,
    required this.size,
    required this.obsecure,
    required this.fun,
    required this.label,
    required this.hint,
    this.mycontroller,
  });

  final Size size;
  final bool obsecure;
  final VoidCallback fun;
  final String label;
  final String hint;
  final TextEditingController? mycontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: size.height * 20 / 932),
      child: Container(
        padding: const EdgeInsets.only(top: 7),
        child: SizedBox(
          height: size.height * 50 / 932,
          child: TextFormField(
            controller: mycontroller,
            obscureText: obsecure,
            decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                suffixIcon: InkWell(
                  onTap: fun,
                  child:
                      Icon(!obsecure ? Icons.visibility : Icons.visibility_off),
                ),
                hintStyle: const TextStyle(color: Color(0xffB2AAAA)),
                contentPadding: EdgeInsets.only(left: size.width * 18 / 430),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none)),
          ),
        ),
      ),
    );
  }
}
