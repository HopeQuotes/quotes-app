import 'package:common/core/widgets/button_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login_text_widget.dart';

class LoginScreen extends StatelessWidget {
  final Function(Module) navigate;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            transform: Matrix4.translationValues(MediaQuery.of(context).size.width * .2, 1.0, 0.0),
            padding: const EdgeInsets.only(left: 100),
            child: Icon(
              Icons.rectangle_outlined,
              size: 200,
              color: Colors.white.withAlpha(124),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            transform:
                Matrix4.translationValues((MediaQuery.of(context).size.width) * -0.6, -200.0, 0.0),
            padding: const EdgeInsets.only(left: 100),
            child: Icon(
              Icons.track_changes,
              size: 200,
              color: Colors.white.withAlpha(124),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            transform:
                Matrix4.translationValues(MediaQuery.of(context).size.width * .36, 65.0, 0.0),
            width: double.infinity,
            child: Icon(
              Icons.circle_outlined,
              size: 200,
              color: Colors.white.withAlpha(124),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Input(
                hint: 'Email',
                margin: const EdgeInsets.only(left: 24, right: 24, top: 0),
              ),
              Input(
                hint: 'Password',
                margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
              )
            ],
          ),
        ),
        Button(
          title: 'Login',
          onClick: () {
            navigate.call(Module.home);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) => Core(),
            //   ),
            // );
          },
        ),
        const TitleText(
          text: 'Login',
        ),
      ],
    );
  }

  LoginScreen({
    required this.navigate,
  });
}
