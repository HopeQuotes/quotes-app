import 'package:auth/entrance/entrance_screen.dart';
import 'package:common/navigation/exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quotes/core.dart';

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
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: EntranceScreen(
        navigate: (module) {
          if (module == Module.home) {
            context.navigateTo(Core());
          }
        },
      )),
    );
  }
}
