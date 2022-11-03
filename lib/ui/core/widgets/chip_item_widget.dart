import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes/ui/core/widgets/elevated_container_widget.dart';

import '../../../resources/colors.dart';

class ChipItem extends StatefulWidget {
  final String text;
  final Function(int) onDelete;
  final int index;

  @override
  State<ChipItem> createState() => _ChipItemState();

  ChipItem({
    super.key,
    required this.text,
    required this.index,
    required this.onDelete,
  });
}

class _ChipItemState extends State<ChipItem> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  Color iconColor = AppColors.indigo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        onDismissed: (dir) {
          widget.onDelete.call(widget.index);
        },
        key: ObjectKey(DateTime.now().millisecondsSinceEpoch.toString()),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: backgroundColor,
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.numbers,
                    color: iconColor,
                  ),
                  Text(
                    widget.text,
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w600, fontSize: 16, color: textColor),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            //
          },
        ));
  }
}
