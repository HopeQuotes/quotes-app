import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_quotes/full_screen_quote/exp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home/home/exp.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:my_quotes/my_quotes/exp.dart';
import 'package:profile/profile_screen.dart';
import 'package:publish/publish_screen.dart';

class Core extends StatefulWidget {
  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  final _mainScreens = [
    const HomeScreen(),
    const FullScreenQuotesScreen(),
    PublishScreen(),
    MyQuotesScreen(),
    ProfileScreen(),
  ];

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        labels: const ["Home", "Quotes", "Publish", "My quotes", "Profile"],
        initialSelectedTab: "Home",
        tabIconColor: AppColors.indigo,
        tabSelectedColor: AppColors.indigo,
        onTabItemSelected: (int value) {
          setState(() {
            if (value == 2) {
              context.navigateTo(PublishScreen());
            } else {
              screenIndex = value;
            }
          });
        },
        icons: const [
          Icons.home_outlined,
          Icons.my_library_books_rounded,
          Icons.add,
          Icons.format_quote_rounded,
          Icons.person_outline
        ],
        textStyle:
            GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black26),
      ),
      body: _mainScreens[screenIndex],
    );
  }
}
