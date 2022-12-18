class Quote {
  String id;
  QuoteState state;
  String author;
  String text;
  List<String> hashtags;
  QuoteImage image;

  Quote(this.id, this.state, this.author, this.text, this.hashtags, this.image);
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

class QuoteImage {
  String id;
  String color;
  String blurHash;
  String author;
  String url;

  QuoteImage({
    required this.id,
    required this.color,
    required this.blurHash,
    required this.author,
    required this.url,
  });
}
