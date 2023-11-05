import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerContainer extends StatelessWidget {
  const TimerContainer({
    super.key,
    this.text,
  });
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.black),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.raleway(fontSize: 35, color: Colors.white),
        ),
      ),
    );
  }
}
