import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ElevatedContainer extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Color color;
  final Gradient? gradient;
  final EdgeInsets margin;
  final double? spread;
  final double? blur;
  final double radius;

  @override
  State<ElevatedContainer> createState() => _ElevatedContainerState();

  const ElevatedContainer({
    required this.child,
    this.height = 128,
    this.width = double.infinity,
    this.color = Colors.white,
    this.spread = 232.0,
    this.blur = 24.0,
    this.radius = 24,
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
              borderRadius: BorderRadius.circular(widget.radius),
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
              borderRadius: BorderRadius.circular(widget.radius),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(widget.radius),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
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
