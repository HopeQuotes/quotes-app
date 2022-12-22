import 'package:data/cache/database/core/app_database.dart';
import 'package:domain/models/ui/quote.dart';

extension QuoteMapper on QuotesCache {
  Quote toUi() {
    return Quote(id, state, author, body, [], photo, photoHash, false);
  }
}
