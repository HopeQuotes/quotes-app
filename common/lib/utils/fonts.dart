import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(
    {double size = 16, Color color = Colors.white, FontWeight weight = FontWeight.bold}) {
  return GoogleFonts.nunito(fontSize: size, color: color, fontWeight: weight);
}
