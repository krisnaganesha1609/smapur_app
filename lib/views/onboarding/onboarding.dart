import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/views/auth/primary_auth.dart';
import 'package:smapur/views/onboarding/onboarding_content.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _storeOnboardingInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return BaseApp.puraBgApp(
      body: Column(
        children: [
          Expanded(
              child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              contents[i].title,
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w700, fontSize: 36),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              contents[i].description,
                              style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w300, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    );
                  })),
          Container(
            color: Colors.transparent,
            child: onBoardingBottomAction(),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      margin: const EdgeInsets.only(right: 5),
      decoration: currentIndex == index
          ? const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.dotIcon), fit: BoxFit.cover))
          : BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.black),
    );
  }

  onBoardingBottomAction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _controller.animateToPage(2,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.bounceOut);
            },
            child: Text(
              'Skip',
              style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (currentIndex == contents.length - 1) {
                _storeOnboardingInfo();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PrimaryAuth()));
              }
              _controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  currentIndex == contents.length - 1 ? 'Begin' : 'Next',
                  style: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black),
                ),
                const SizedBox(
                  width: 5,
                ),
                currentIndex == contents.length - 1
                    ? const SizedBox()
                    : const Icon(
                        Icons.arrow_forward_rounded,
                        size: 22.0,
                        color: Colors.black,
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
