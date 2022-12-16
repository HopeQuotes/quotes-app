class QuoteImage {
  String id;
  String color;
  String blurHash;
  String author;
  String url;
  bool isSelected;

  QuoteImage({
    required this.id,
    required this.color,
    required this.blurHash,
    required this.author,
    required this.url,
    this.isSelected = false,
  });

  QuoteImage copyWith({
    String? id,
    String? color,
    String? blurHash,
    String? author,
    String? url,
    bool? isSelected,
  }) {
    return QuoteImage(
      id: id ?? this.id,
      color: color ?? this.color,
      blurHash: blurHash ?? this.blurHash,
      author: author ?? this.author,
      url: url ?? this.url,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
