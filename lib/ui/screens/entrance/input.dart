import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors.dart';

class Input extends StatelessWidget {
  final String hint;
  final EdgeInsets margin;
  bool multiLine = false;
  final FocusNode? focusNode;
  double verticalPadding = 0.0;
  double blur;
  double spread;
  final TextEditingController? controller;
  final Function(String)? onSubmit;

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
        onSubmitted: (str) {
          onSubmit?.call(str);
        },
        focusNode: focusNode,
        keyboardType: multiLine ? TextInputType.multiline : TextInputType.name,
        maxLines: multiLine ? null : 1,
        textAlign: TextAlign.start,
        controller: controller,
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
    this.controller,
    this.blur = 200.0,
    this.onSubmit,
    this.spread = 12.0,
    required this.margin,
  });
}
