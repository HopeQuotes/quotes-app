import 'dart:html';

import 'package:common/navigation/exp.dart';
import 'package:common/resources/colors.dart';
import 'package:common/utils/fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_quotes/full_screen_quote/full_screen_quotes_screen.dart';
import 'package:home/home/home_screen.dart';
import 'package:my_quotes/my_quotes/my_quotes_screen.dart';
import 'package:profile/profile_screen.dart';
import 'package:publish/create_quote_screen.dart';

class Core extends StatefulWidget {
  const Core({super.key});

  @override
  State<Core> createState() => _CoreState();
}

class _CoreState extends State<Core> {
  final _mainScreens = [
    const HomeScreen(),
    const FullScreenQuotesScreen(),
    Container(),
    const MyQuotesScreen(),
    ProfileScreen(),
  ];

  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 0, blurRadius: 10),
        ], borderRadius: BorderRadius.circular(24)),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            selectedLabelStyle: getTextStyle(size: 14),
            onTap: (index) {
              if (index == 2) {
                setState(() {
                  screenIndex = 0;
                });
                context.navigateTo(const PublishScreen());
              }
              setState(() {
                screenIndex = index;
              });
            },
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black12,
            currentIndex: screenIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye_rounded), label: 'Reels'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Publish'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.open_with), label: 'My quotes'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
      body: _mainScreens[screenIndex],
    );
  }
}
