import 'package:final_project/models/onBoardingPage.dart';
import 'package:final_project/screens/sign_in_up/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'onBoardingPage/onBoardingPages.dart';

class onbording_screen extends StatefulWidget {
  const onbording_screen({super.key});

  @override
  State<onbording_screen> createState() => _onbording_screenState();
}

class _onbording_screenState extends State<onbording_screen> {
  final PageController _controller = PageController();

  bool onlastpage = false;
  final List<onBoardingPagesmodel> boardingPages = [
    const onBoardingPagesmodel(
        lottieUrl: "assets/lottieFiles/first.json",
        title: "Online booking service"),
    const onBoardingPagesmodel(
        lottieUrl: "assets/lottieFiles/findDoctor.json",
        des: "you can choose any doctor you want in many specialties",
        title: "Choose doctor"),
    const onBoardingPagesmodel(
        lottieUrl: "assets/lottieFiles/consultation.json",
        des: "you can get online consultation from many doctors on our app",
        title: "Online consultation"),
    const onBoardingPagesmodel(
        lottieUrl: "assets/lottieFiles/vedioCall.json",
        title: "Thousands of specialists",
        des:
            "get medical advise and treatment services from specialist doctors at any time"),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 0.90,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    onlastpage = (index == boardingPages.length - 1);
                  });
                },
                controller: _controller,
                children: [
                  ...List.generate(boardingPages.length,
                      (index) => onBoardingPages(page: boardingPages[index]))
                ],
              ),
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(boardingPages.length);
                    },
                    child: Text(
                      "skip",
                      style: TextStyle(
                          color: const Color(0xFF50B7C5),
                          fontSize: size.height * 18 / 932,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: boardingPages.length,
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xFF50B7C5)),
                    ),
                  ),
                  onlastpage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const logIn()),
                            );
                          },
                          child: Text(
                            "finish",
                            style: TextStyle(
                                color: const Color(0xFF50B7C5),
                                fontSize: size.height * 18 / 932,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut);
                          },
                          child: Text(
                            "next",
                            style: TextStyle(
                                color: const Color(0xFF50B7C5),
                                fontSize: size.height * 18 / 932,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
