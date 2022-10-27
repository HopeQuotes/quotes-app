import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors.dart';

class Input extends StatelessWidget {
  String hint;
  EdgeInsets margin;
  bool multiLine = false;
  FocusNode? focusNode;
  double verticalPadding = 0.0;
  double blur;
  double spread;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: blur,
            spreadRadius: spread,
            offset: const Offset(0, 0), // shadow direction: bottom right
          )
        ],
      ),
      margin: margin,
      child: TextField(
        focusNode: focusNode,
        keyboardType: multiLine ? TextInputType.multiline : TextInputType.name,
        maxLines: multiLine ? null : 1,
        textAlign: TextAlign.start,
        controller: TextEditingController(),
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
          contentPadding:
              EdgeInsets.only(left: 20, bottom: verticalPadding, top: verticalPadding, right: 20),
          fillColor: AppColors.white,
        ),
      ),
    );
  }

  Input({
    super.key,
    required this.hint,
    this.multiLine = false,
    this.verticalPadding = 20,
    this.focusNode,
    this.blur = 4.0,
    this.spread = 4.0,
    required this.margin,
  });
}
