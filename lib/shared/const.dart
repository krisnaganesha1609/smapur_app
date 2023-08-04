import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstantsValue {
  static const Color primaryBgColor = Color(0xB3FFFFFF);
  static const Color darkBgColor = Color(0xFF000000);
  static const Color primaryBtnColor = Color(0xFF43DAFB);
  static const Color lightGreenBtnColor = Color(0xFF3FF6BF);
  static const Color yellowColor = Color(0xFFFDD60B);

  static const Color darkText = Color(0xFFFFFFFF);
  static const Color primaryText = Color(0xFF000000);
  static const Color lightText = Color.fromARGB(115, 0, 0, 0);

  static TextStyle primaryHeading = GoogleFonts.dmSans(
      fontSize: 30, fontWeight: FontWeight.w700, color: primaryText);

  static TextStyle primarySubheading = GoogleFonts.dmSans(
      fontSize: 26, fontWeight: FontWeight.w600, color: primaryText);

  static TextStyle primaryParagraph = GoogleFonts.dmSans(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: primaryText,
      shadows: [
        Shadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(5, 5),
            blurRadius: 12)
      ]);

  static TextStyle primaryInlineText = GoogleFonts.dmSans(
      fontSize: 16, fontWeight: FontWeight.w500, color: primaryText);

  static TextStyle primaryTransparentText = GoogleFonts.dmSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: lightText,
  );
}
