import 'package:flutter/material.dart';

import '../../shared/base.dart';

class Funds extends StatefulWidget {
  const Funds({super.key});

  @override
  State<Funds> createState() => _FundsState();
}

class _FundsState extends State<Funds> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BaseApp.puraBgApp(
        body: const Center(
          child: Text("Funds"),
        ),
      ),
    );
  }
}
