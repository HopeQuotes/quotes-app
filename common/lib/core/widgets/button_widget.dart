import 'package:common/core/widgets/elevated_container_widget.dart';
import 'package:common/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatefulWidget {
  final String title;
  final Function onClick;
  final bool? loading;

  @override
  State<Button> createState() => _ButtonState();

  const Button({
    super.key,
    required this.title,
    required this.onClick,
    this.loading = false,
  });
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedContainer(
        spread: 4,
        blur: 4,
        color: widget.loading == true
            ? AppColors.indigo.withAlpha(62)
            : AppColors.indigo.withAlpha(180),
        margin: const EdgeInsets.all(24),
        height: 62,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            alignment: Alignment.center,
            child: widget.loading == true
                ? SpinKitSpinningLines(
                    color: Colors.white,
                    size: 30.0,
                    controller: _animationController,
                  )
                : Text(
                    widget.title,
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
          ),
          onTap: () {
            widget.onClick.call();
          },
        ),
      ),
    );
  }
}
