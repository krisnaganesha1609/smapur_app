import 'package:flutter/material.dart';
import 'package:smapur/shared/const.dart';

class FamilyNode extends StatelessWidget {
  final String name;
  const FamilyNode({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        name,
        style: ConstantsValue.primaryInlineText,
      ),
    );
  }
}

class FamilyTreePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Draw connecting lines
    canvas.drawLine(const Offset(200, 40), const Offset(200, 100), paint);
    canvas.drawLine(const Offset(200, 120), const Offset(50, 180), paint);
    canvas.drawLine(const Offset(200, 120), const Offset(350, 180), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
