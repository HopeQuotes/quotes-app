import 'image.dart';

class Quote {
  String id;
  String state;
  String author;
  String text;
  List<String> hashtags;
  String image;
  String imageHash;
  bool? isLiked;

  Quote(this.id, this.state, this.author, this.text, this.hashtags, this.image,
      this.imageHash, this.isLiked);
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
