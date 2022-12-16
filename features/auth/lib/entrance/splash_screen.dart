import 'package:auth/entrance/entrance_screen.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/utils/colors.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/cupertino.dart';
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
          color: primaryColor,
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
