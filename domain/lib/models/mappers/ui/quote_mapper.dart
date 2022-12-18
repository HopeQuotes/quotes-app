import '../../response/quote_response.dart';
import '../../response/quote_state_response.dart';
import '../../ui/quote.dart';

extension QuoteResponseToUiMapper on QuoteResponse {
  Quote toUi() {
    return Quote(id, state.toUi(), author, text,
        hashtags.map((e) => e.value).toList(), photo.toUi());
  }
}

extension StateMapper on QuoteStateResponse {
  QuoteState toUi() {
    return QuoteState(id: id, value: value, idDefault: idDefault, color: color);
  }
}

extension ImageMapper on QuoteImageResponse {
  QuoteImage toUi() {
    return QuoteImage(
        id: id, color: color, blurHash: blurHash, author: author, url: url);
  }
}
