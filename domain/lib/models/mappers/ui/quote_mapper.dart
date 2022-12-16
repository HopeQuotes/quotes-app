import '../../response/quote_response.dart';
import '../../response/quote_state_response.dart';
import '../../ui/quote.dart';

extension QuoteResponseToUiMapper on QuoteResponse {
  Quote toUi() {
    return Quote(
        id, state.toUi(), author, text, hashtags.map((e) => e.value).toList());
  }
}

extension StateMapper on QuoteStateResponse {
  QuoteState toUi() {
    return QuoteState(id: id, value: value, idDefault: idDefault, color: color);
  }
}
