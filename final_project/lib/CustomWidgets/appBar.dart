import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({
    super.key,
    required this.name,
    required this.isDoctor,
    required this.image,
  });
  final String name;
  final bool isDoctor;
  final String image;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 65 / 932,
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDoctor == false
                    ? Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: size.height * 15 / 932),
                            child: ClipOval(
                              child: Image.asset(image),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hey, $name",
                                style: TextStyle(
                                    fontSize: size.height * 20 / 932,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Find your Speciealist",
                                style: TextStyle(
                                    fontSize: size.height * 15 / 932,
                                    color: const Color(0xffB2AAAA)),
                              )
                            ],
                          )
                        ],
                      )
                    : Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(right: size.height * 15 / 932),
                            child: ClipOval(
                              child: Image.asset(image),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good morning",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 16 / 932,
                                    color: const Color(0xffB2AAAA)),
                              ),
                              Text(
                                "Dr. $name",
                                style: TextStyle(
                                    fontSize: size.height * 20 / 932,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: size.height * 45 / 932,
                        height: size.height * 45 / 932,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.account_balance_wallet_outlined,
                            color: Color(0xff757575),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: size.height * 45 / 932,
                        height: size.height * 45 / 932,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.notifications_none,
                            color: Color(0xff757575),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
