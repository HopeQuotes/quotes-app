import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.only(top: 62, left: 24),
        child: Text(
          text,
          style: GoogleFonts.nunito(fontSize: 42, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  const TitleText({
    required this.text,
  });
}
