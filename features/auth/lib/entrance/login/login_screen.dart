import 'package:auth/entrance/login/bloc/login_bloc.dart';
import 'package:auth/entrance/login/bloc/login_event.dart';
import 'package:auth/entrance/login/bloc/login_state.dart';
import 'package:common/core/widgets/button_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/utils/print.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_text_widget.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(injector()),
      child: BlocConsumer<LoginBloc, LoginState>(builder: (context, state) {
        final bloc = context.read<LoginBloc>();
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
                  children: [
                    Input(
                      controller: bloc.emailController,
                      hint: 'Email',
                      margin:
                          const EdgeInsets.only(left: 24, right: 24, top: 0),
                    ),
                    Input(
                      controller: bloc.passwordController,
                      hint: 'Password',
                      margin:
                          const EdgeInsets.only(left: 24, right: 24, top: 24),
                    )
                  ],
                ),
              ),
              Button(
                loading: state.loginStatus == LoginStatus.loading,
                title: 'Login',
                onClick: () {
                  bloc.add(Login());
                  // navigate.call(Module.home);
                },
              ),
              const TitleText(
                text: 'Login',
              ),
            ],
          ),
        );
      }, listener: (context, state) {
        if (state.loginStatus == LoginStatus.fail) {
          context.showSnackBar(state.message, status: MessageStatus.fail);
        }
        if (state.loginStatus == LoginStatus.success) {
          Navigator.pushNamedAndRemoveUntil(
              context, "/main", (Route<dynamic> route) => false);
        }
      }),
    );
  }
}
