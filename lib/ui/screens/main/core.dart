import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:quotes/ui/screens/main/profile.dart';

import 'full_screen_quotes.dart';
import 'home.dart';

class Core extends StatefulWidget {
  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  final _mainScreens = [
    HomeScreen(),
    FullScreenQuotes(),
    Profile(),
  ];

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        labels: const ["Home", "Quotes", "Profile"],
        initialSelectedTab: "Home",
        tabIconColor: Colors.indigo,
        tabSelectedColor: Colors.indigo,
        onTabItemSelected: (int value) {
          setState(() {
            screenIndex = value;
          });
        },
        icons: const [Icons.home_outlined, Icons.format_quote_rounded, Icons.person_outline],
        textStyle:
            GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black26),
      ),
      body: _mainScreens[screenIndex],
    );
  }
}
