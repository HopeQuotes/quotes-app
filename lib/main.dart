import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quotes/resources/colors.dart';
import 'package:quotes/ui/screens/main/full_screen_quotes.dart';
import 'package:quotes/ui/screens/main/home.dart';
import 'package:quotes/ui/screens/main/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  int screenIndex = 0;

  final _mainScreens = [
    HomeScreen(),
    FullScreenQuotes(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.white,
        animationDuration: const Duration(milliseconds: 250),
        backgroundColor: AppColors.backgroundColor,
        items: [
          Icon(
            Icons.home_outlined,
            size: 30,
            color: AppColors.black,
          ),
          Icon(
            Icons.quora_outlined,
            size: 30,
            color: AppColors.black,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: AppColors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            screenIndex = index;
          });
        },
      ),
      body: SafeArea(child: _mainScreens[screenIndex]),
    );
  }
}
