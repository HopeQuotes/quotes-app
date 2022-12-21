import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Paths {
  static Future<String> getApplicationDocPath() async {
    return (await (getApplicationDocumentsDirectory())).path;
  }
}
