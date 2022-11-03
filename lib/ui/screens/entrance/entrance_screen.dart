import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/screens/entrance/login/login_screen.dart';
import 'package:quotes/ui/screens/entrance/register/register_screen.dart';
import 'package:quotes/utils/array.dart';

class EntranceScreen extends StatefulWidget {
  const EntranceScreen({super.key});

  @override
  State<EntranceScreen> createState() => _EntranceScreenState();
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
              return LoginScreen();
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
