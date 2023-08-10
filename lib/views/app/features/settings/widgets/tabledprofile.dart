import 'package:flutter/material.dart';

class TabledProfileWidget extends StatelessWidget {
  final String pageName;
  final Widget content;
  final String lastEdited;
  final VoidCallback save;
  const TabledProfileWidget(
      {super.key,
      required this.pageName,
      required this.content,
      required this.lastEdited,
      required this.save});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
