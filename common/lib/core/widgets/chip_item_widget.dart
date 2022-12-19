import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/colors.dart';

class ChipItem extends StatefulWidget {
  final String text;
  final Function(int) onDelete;
  final Function? onSelect;
  final int index;
  final bool canDismiss;
  final bool elevationEffect;

  @override
  State<ChipItem> createState() => _ChipItemState();

  const ChipItem({
    super.key,
    required this.text,
    required this.index,
    required this.onDelete,
    this.onSelect,
    this.canDismiss = true,
    this.elevationEffect = true,
  });
}

class _ChipItemState extends State<ChipItem> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  Color iconColor = AppColors.indigo;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: !widget.canDismiss
          ? DismissDirection.none
          : DismissDirection.startToEnd,
      onDismissed: (dir) {
        widget.onDelete.call(widget.index);
      },
      key: ObjectKey(DateTime.now().millisecondsSinceEpoch.toString()),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: backgroundColor,
            boxShadow: widget.elevationEffect
                ? [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.05),
                      blurRadius: 232,
                      spreadRadius: 24,
                      offset:
                          const Offset(0, 0), // shadow direction: bottom right
                    )
                  ]
                : [],
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
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: textColor),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          widget.onSelect?.call();
        },
      ),
    );
  }
}
