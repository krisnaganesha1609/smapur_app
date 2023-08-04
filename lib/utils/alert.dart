import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertService {
  static void showAlert(
      {required String title,
      required String body,
      required VoidCallback onCancel,
      required VoidCallback onOk,
      required BuildContext context}) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                title,
                style: GoogleFonts.dmSans(),
              ),
              actions: [
                TextButton(onPressed: onOk, child: const Text("Confirm")),
                TextButton(onPressed: onCancel, child: const Text("Cancel")),
              ],
            ));
  }
}
