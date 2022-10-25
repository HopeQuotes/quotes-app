import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors.dart';

class Input extends StatelessWidget {
  String hint;
  EdgeInsets margin;



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 4.0,
            spreadRadius: 4.0,
            offset: const Offset(0, 0), // shadow direction: bottom right
          )
        ],
      ),
      margin: margin,
      child: TextField(
        textAlign: TextAlign.start,
        controller: TextEditingController(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide(color: AppColors.indigo.withAlpha(180), width: 2),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.black12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: const EdgeInsets.all(20),
          fillColor: AppColors.white,
        ),
      ),
    );
  }

  Input({
    required this.hint,
    required this.margin,
  });
}
