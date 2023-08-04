import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smapur/views/splash/splash.dart';

int? isViewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 119, 244, 70),
      statusBarIconBrightness: Brightness.light));
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoarding');
  runApp(const ProviderScope(child: SmapurApp()));
}

class SmapurApp extends StatelessWidget {
  const SmapurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMAPUR',
      builder: ((context, child) =>
          ScrollConfiguration(behavior: MyBehavior(), child: child!)),
      debugShowCheckedModeBanner: false,
      home: Splash(isViewed: isViewed),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
