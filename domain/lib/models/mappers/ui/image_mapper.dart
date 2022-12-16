import 'package:domain/models/response/image_response.dart';
import '../../ui/image.dart';

extension ImageResponseToUiMapper on ImageResponse {
  QuoteImage toUi() {
    return QuoteImage(
        id: id, color: color, blurHash: blurHash, author: author, url: url);
  }
}
