import 'package:flutter/material.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({
    super.key,
    required this.name,
    required this.isDoctor,
    required this.image,
    this.api,
  });
  final String name;
  final bool isDoctor;
  final String image;
  final bool? api;

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
                          api == true
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      right: size.height * 15 / 932),
                                  child: SizedBox(
                                    width: size.height * 60 / 932,
                                    height: size.height * 60 / 932,
                                    child: ClipOval(
                                      child: Image.network(
                                        image,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          // Fallback to default image if there's an error
                                          return Image.asset(
                                            'assets/images/default-avatar.jpg',
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                  ))
                              : Padding(
                                  padding: EdgeInsets.only(
                                      right: size.height * 15 / 932),
                                  child: SizedBox(
                                    width: size.height * 60 / 932,
                                    height: size.height * 60 / 932,
                                    child: ClipOval(
                                      child: Image.asset(
                                        image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )),
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
