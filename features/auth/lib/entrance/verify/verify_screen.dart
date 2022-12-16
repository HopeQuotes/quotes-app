import 'package:auth/entrance/verify/bloc/verify_bloc.dart';
import 'package:auth/entrance/verify/bloc/verify_state.dart';
import 'package:common/core/widgets/button_widget.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/constants.dart';
import 'package:common/utils/print.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../login_text_widget.dart';
import 'bloc/verify_event.dart';

class VerifyScreen extends StatelessWidget {
  final String email;

  const VerifyScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VerifyBloc(injector()),
      child: BlocConsumer<VerifyBloc, VerifyState>(builder: (context, state) {
        final bloc = context.read<VerifyBloc>();
        return Material(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * .2, 1.0, 0.0),
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
                  transform: Matrix4.translationValues(
                      MediaQuery.of(context).size.width * .36, 65.0, 0.0),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OtpTextField(
                      numberOfFields: 4,
                      fieldWidth: 56,
                      borderRadius:
                          BorderRadius.circular(Corners.cornerRadius / 2),
                      cursorColor: AppColors.indigo.withAlpha(180),
                      focusedBorderColor: AppColors.indigo.withAlpha(180),
                      borderColor: AppColors.black,
                      showFieldAsBox: true,
                      onSubmit: (String verificationCode) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        bloc.otpController.text = verificationCode;
                        bloc.add(Verify(email: email));
                      },
                    ),
                  ],
                ),
              ),
              Button(
                title: 'Verify',
                onClick: () {
                  bloc.add(Verify(email: email));
                },
              ),
              const TitleText(text: 'Verify'),
            ],
          ),
        );
      }, listener: (context, state) {
        if (state.verifyStatus == VerifyStatus.fail) {
          context.showSnackBar(state.message, status: MessageStatus.fail);
        }
        if (state.verifyStatus == VerifyStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/main", (Route<dynamic> route) => false);
        }
      }),
    );
  }
}
