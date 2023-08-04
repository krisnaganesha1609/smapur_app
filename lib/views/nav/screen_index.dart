import 'package:flutter/material.dart';
import 'package:smapur/views/app/activity.dart';
import 'package:smapur/views/app/funds.dart';
import 'package:smapur/views/app/home.dart';
import 'package:smapur/views/app/settings.dart';

class ScreenIndex {
  List<Widget> buildPageView() {
    return const [Home(), Activity(), Funds(), Settings()];
  }
}
