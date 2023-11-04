import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final text;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        child: Text(
          text,
          style: GoogleFonts.raleway(fontSize: 18),
        ),
      ),
    );
  }
}
