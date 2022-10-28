import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/ui/core/widgets/elevated_container.dart';

import '../../../resources/colors.dart';

class ChipItemAdd extends StatefulWidget {
  final Function() onClick;

  @override
  State<ChipItemAdd> createState() => _ChipItemState();

  ChipItemAdd({
    super.key,
    required this.onClick,
  });
}

class _ChipItemState extends State<ChipItemAdd> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 232,
              spreadRadius: 24,
              offset: const Offset(0, 0), // shadow direction: bottom right
            )
          ],
        ),
        margin: const EdgeInsets.all(12),
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Icon(
            Icons.add,
            color: AppColors.indigo,
          ),
        ),
      ),
      onTap: () {
        widget.onClick.call();
      },
    );
  }
}
