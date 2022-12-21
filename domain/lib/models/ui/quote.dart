import 'image.dart';

class Quote {
  String id;
  QuoteState state;
  String author;
  String text;
  List<String> hashtags;
  QuoteImage image;
  bool? isLiked;

  Quote(this.id, this.state, this.author, this.text, this.hashtags, this.image,
      this.isLiked);
}

class QuoteState {
  String id;
  String value;
  bool idDefault;
  String color;

  QuoteState({
    required this.id,
    required this.value,
    required this.idDefault,
    required this.color,
  });
}
