import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum StartDirection {
  start(-2, 0),
  end(2, 0),
  bottom(0, 2),
  top(0, -2);

  const StartDirection(this.dx, this.dy);

  final double dx;
  final double dy;
}

class TransitionAnimWidget extends StatefulWidget {
  final Widget child;
  final int duration;
  final StartDirection startDirection;

  const TransitionAnimWidget(
      {required this.child,
      required this.duration,
      this.startDirection = StartDirection.start,
      super.key});

  @override
  AnimatedCrossFadeExampleState createState() => AnimatedCrossFadeExampleState();
}

class AnimatedCrossFadeExampleState extends State<TransitionAnimWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.duration),
      vsync: this,
    )..forward();
    _animation = Tween<Offset>(
      begin: Offset(widget.startDirection.dx, widget.startDirection.dy),
      end: const Offset(0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    Future.delayed(Duration(milliseconds: widget.duration ~/ 2), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: AnimatedOpacity(
        opacity: _visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: widget.duration),
        child: widget.child,
      ),
    );
  }
}
