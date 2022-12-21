import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auth/entrance/entrance_screen.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/colors.dart';
import 'package:common/utils/fonts.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(injector())..add(CheckUserStatus()),
      child: BlocConsumer<SplashBloc, SplashState>(builder: (context, state) {
        return Container(
          color: AppColors.indigo.withAlpha(180),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText('Quotes app',
                          textStyle:
                              getTextStyle(size: 20, color: Colors.white)),
                      TyperAnimatedText('Share your minds...',
                          textStyle:
                              getTextStyle(color: Colors.white, size: 20)),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    "@xaldarof",
                    style: getTextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      }, listener: (context, state) {
        if (state.status == SplashStatus.authorized) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/main", (Route<dynamic> route) => false);
        }
        if (state.status == SplashStatus.unAuthorized) {
          context.navigateTo(const EntranceScreen(), removeStack: true);
        }
      }),
    );
  }
}
