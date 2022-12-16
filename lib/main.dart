import 'package:auth/entrance/entrance_screen.dart';
import 'package:auth/entrance/verify/verify_screen.dart';
import 'package:common/navigation/exp.dart';
import 'package:di/data_module_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes/core.dart';
import 'package:auth/entrance/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init("${(await getApplicationDocumentsDirectory()).path}/boxes");
  initDomainModuleDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => Core(),
      },
      debugShowCheckedModeBanner: false,
      home: const Quotes(),
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
      body: SafeArea(child: SplashScreen()),
    );
  }
}
