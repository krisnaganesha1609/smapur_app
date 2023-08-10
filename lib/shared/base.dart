import 'package:flutter/material.dart';
import 'package:smapur/res/assets.dart';

class BaseApp {
  static Widget puraBgApp({
    final PreferredSizeWidget? appBar,
    required Widget body,
    final Widget? floatingActionButton,
    final FloatingActionButtonLocation? floatingActionButtonLocation,
  }) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(ImageAssets.puraBg),
              fit: BoxFit.contain,
              alignment: Alignment.bottomCenter),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: Container(
            child: body,
          ),
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        ),
      ),
    );
  }
}
