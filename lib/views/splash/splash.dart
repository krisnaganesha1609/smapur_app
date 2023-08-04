import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/base.dart';
import 'package:smapur/views/auth/primary_auth.dart';
import 'package:smapur/views/onboarding/onboarding.dart';

class Splash extends StatefulWidget {
  final int? isViewed;
  const Splash({super.key, required this.isViewed});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return BaseApp.puraBgApp(
      body: AnimatedSplashScreen(
        backgroundColor: Colors.transparent,
        nextScreen:
            widget.isViewed != 0 ? const Onboarding() : const PrimaryAuth(),
        splash: ImageAssets.splashLogo,
        splashIconSize: 1000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        animationDuration: const Duration(milliseconds: 1500),
      ),
    );
  }
}
