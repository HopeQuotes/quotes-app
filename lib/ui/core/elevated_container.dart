import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class ElevatedContainer extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final Gradient? gradient;
  final EdgeInsets margin;
  final double? spread;
  final double? blur;

  @override
  State<ElevatedContainer> createState() => _ElevatedContainerState();

  ElevatedContainer({
    required this.child,
    this.height = 128,
    this.width = double.infinity,
    this.color = Colors.white,
    this.spread = 10.0,
    this.blur = 18.0,
    this.gradient,
    this.margin = EdgeInsets.zero,
  });
}

class _ElevatedContainerState extends State<ElevatedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: double.infinity,
      child: AnimatedContainer(
        height: widget.height,
        width: widget.width,
        duration: const Duration(milliseconds: 100),
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Corners.cornerRadius),
              color: widget.color,
              gradient: widget.gradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: widget.spread ?? 18,
                  spreadRadius: widget.blur ?? 10,
                  offset: const Offset(0, 0), // shadow direction: bottom right
                )
              ],
            ),
            child: Material(
              color: widget.color,
              borderRadius: BorderRadius.circular(Corners.cornerRadius),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Corners.cornerRadius),
                    gradient: widget.gradient,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
