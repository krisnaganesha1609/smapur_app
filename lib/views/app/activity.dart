import 'package:flutter/material.dart';
import 'package:smapur/shared/base.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BaseApp.puraBgApp(
        body: const Center(
          child: Text("Activity"),
        ),
      ),
    );
  }
}
