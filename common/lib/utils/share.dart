import 'package:share_plus/share_plus.dart';

class QuoteShare {
  static Future<void> share(String? path) async {
    if (path != null) {
      await Share.shareXFiles([XFile(path)],
          text:
              "Хэй посмотри я скачал приложение Quotes\nТы тоже попробуй\n\n\n[play_market_url]");
    }
  }
}
