import 'package:flutter/material.dart';

class pill extends StatelessWidget {
  const pill({
    super.key,
    required this.size,
    required this.icon,
    required this.name,
    required this.amount,
    required this.breakfast,
    required this.lunch,
    required this.dinner,
    required this.capsize,
  });

  final Size size;
  final String icon;
  final String name;
  final int amount;
  final int capsize;
  final String breakfast;
  final String lunch;
  final String dinner;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.only(
          right: size.width * 5 / 320,
        ),
        height: size.height * 150 / 932,
        width: size.width * 170 / 320,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              FittedBox(child: Image.asset(icon)),
              FittedBox(child: Text(name)),
              FittedBox(child: Text("$capsize mg, $amount capsule")),
              FittedBox(
                child: Row(
                  children: <Widget>[
                    breakfast == ""
                        ? const SizedBox()
                        : Container(
                            padding: EdgeInsets.all(size.height * 4 / 932),
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 5 / 932),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffEBC6D9),
                            ),
                            child: FittedBox(
                              child: Text(
                                breakfast,
                                style: const TextStyle(
                                    color: Color(0xffE25392),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: size.width * 5 / 932,
                    ),
                    lunch == ""
                        ? const SizedBox()
                        : Container(
                            padding: EdgeInsets.all(size.height * 4 / 932),
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 5 / 932),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffCFE1E7),
                            ),
                            child: FittedBox(
                              child: Text(
                                lunch,
                                style: const TextStyle(
                                    color: Color(0xff3C93AD),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                    SizedBox(
                      width: size.width * 5 / 932,
                    ),
                    dinner == ""
                        ? const SizedBox()
                        : Container(
                            padding: EdgeInsets.all(size.height * 4 / 932),
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 5 / 932),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xffDBDAF0),
                            ),
                            child: FittedBox(
                              child: Text(
                                dinner,
                                style: const TextStyle(
                                    color: Color(0xff8C86DD),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
