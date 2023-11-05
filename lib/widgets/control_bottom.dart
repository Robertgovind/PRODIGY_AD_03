import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.text,
    this.onPressed,
    this.logo,
  });
  final text;
  final onPressed;
  final logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => const Color.fromARGB(255, 14, 119, 231),
          ),
          shadowColor: MaterialStateColor.resolveWith((states) => Colors.black),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: GoogleFonts.raleway(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            Icon(
              logo,
              size: 25,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
