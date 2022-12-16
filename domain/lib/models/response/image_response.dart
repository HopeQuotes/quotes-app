import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()
class ImagesResponse {
  List<ImageResponse> data;

  ImagesResponse({
    required this.data,
  });

  factory ImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ImagesResponseFromJson(json);
}

@JsonSerializable()
class ImageResponse {
  String id;
  String color;
  String blurHash;
  String author;
  String url;

  ImageResponse({
    required this.id,
    required this.color,
    required this.blurHash,
    required this.author,
    required this.url,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}
