import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors.dart';
import '../../core/widgets/elevated_container_widget.dart';

class Button extends StatelessWidget {
  String title;
  Function onClick;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedContainer(
        spread: 4,
        blur: 4,
        color: AppColors.indigo.withAlpha(180),
        margin: const EdgeInsets.all(24),
        height: 62,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: GoogleFonts.nunito(
                  fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          onTap: () {
            onClick.call();

          },
        ),
      ),
    );
  }

  Button({
    required this.title,
    required this.onClick,
  });
}
