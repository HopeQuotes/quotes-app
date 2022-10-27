import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding: EdgeInsets.only(top: paddingTop, left: 24),
        child: Text(
          text,
          style: GoogleFonts.nunito(fontSize: 42, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  const TitleText({
    super.key,
    required this.text,
    this.paddingTop = 62,
  });
}
