import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:quotes/ui/screens/entrance/button_widget.dart';
import 'package:quotes/ui/screens/entrance/login_text_widget.dart';
import 'package:quotes/utils/constants.dart';

import '../../../../resources/colors.dart';
import '../../../core/core.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              transform:
                  Matrix4.translationValues(MediaQuery.of(context).size.width * .2, 1.0, 0.0),
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
              transform: Matrix4.translationValues(
                  (MediaQuery.of(context).size.width) * -0.6, -200.0, 0.0),
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
              )),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                OtpTextField(
                  numberOfFields: 4,
                  fieldWidth: 56,
                  borderRadius: BorderRadius.circular(Corners.cornerRadius / 2),
                  cursorColor: AppColors.indigo.withAlpha(180),
                  focusedBorderColor: AppColors.indigo.withAlpha(180),
                  borderColor: AppColors.black,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    //
                  },
                  onSubmit: (String verificationCode) {
                    //verify
                  },
                ),
              ],
            ),
          ),
          Button(
            title: 'Verify',
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Core(),
                ),
              );
            },
          ),
          const TitleText(text: 'Verify'),
        ],
      ),
    );
  }
}
