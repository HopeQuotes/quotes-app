import 'package:auth/entrance/register/register_screen.dart';
import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/array.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login/login_screen.dart';

class EntranceScreen extends StatefulWidget {
  final Function(Module) navigate;


  @override
  State<EntranceScreen> createState() => _EntranceScreenState();

  const EntranceScreen({super.key,
    required this.navigate,
  });
}

class _EntranceScreenState extends State<EntranceScreen> {
  var pageIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: PageView(
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: ["", ""].mapIndexed(
          (index, e) {
            if (index == 0) {
              return LoginScreen(navigate: widget.navigate);
            }
            if (index == 1) {
              return RegisterScreen();
            }

            return Container();
          },
        ).toList(),
      ),
    );
  }
}
