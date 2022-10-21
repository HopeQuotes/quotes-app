import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.home, color: Colors.deepPurple),
          Icon(Icons.person, color: Colors.deepPurple),
          Icon(Icons.person_outline, color: Colors.deepPurple),
        ],
        inactiveIcons: [
          Text(
            "Home",
            style:
                GoogleFonts.nunito(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black),
          ),
          Text("Home",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
          Text("Like",
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black)),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        initIndex: screenIndex,
        onChanged: (v) {
          setState(() {
            screenIndex = v;
          });
        },
        // tabCurve: ,
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        shadowColor: Colors.black12,
        elevation: 6,
      ),
      body: _mainScreens[screenIndex],
    );
  }
}
