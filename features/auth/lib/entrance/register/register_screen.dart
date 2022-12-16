import 'package:auth/entrance/register/bloc/register_bloc.dart';
import 'package:auth/entrance/register/bloc/register_event.dart';
import 'package:auth/entrance/register/bloc/register_state.dart';
import 'package:auth/entrance/verify/verify_screen.dart';
import 'package:common/core/widgets/button_widget.dart';
import 'package:common/core/widgets/input_widget.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/utils/print.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../login_text_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(injector()),
      child:
          BlocConsumer<RegisterBloc, RegisterState>(builder: (context, state) {
        final bloc = context.read<RegisterBloc>();
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
                        controller: bloc.nameController,
                        hint: 'Fullname',
                        margin: const EdgeInsets.only(
                            left: 24, right: 24, bottom: 24)),
                    Input(
                        controller: bloc.emailController,
                        hint: 'Email',
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 0)),
                    Input(
                        controller: bloc.passwordController,
                        hint: 'Password',
                        margin:
                            const EdgeInsets.only(left: 24, right: 24, top: 24))
                  ],
                ),
              ),
              Button(
                title: 'Register',
                onClick: () {
                  bloc.add(Register());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute<void>(
                  //     builder: (BuildContext context) => const VerifyScreen(),
                  //   ),
                  // );
                },
              ),
              const TitleText(text: 'Register')
            ],
          ),
        );
      }, listener: (context, state) {
        if (state.registerStatus == RegisterStatus.fail) {
          context.showSnackBar(state.message, status: MessageStatus.fail);
        }
        if (state.registerStatus == RegisterStatus.success) {
          context.navigateTo(VerifyScreen(
            email: context.read<RegisterBloc>().emailController.text,
          ));
        }
      }),
    );
  }
}
