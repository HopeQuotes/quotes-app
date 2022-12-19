import 'package:json_annotation/json_annotation.dart';

part 'create_quote_request.g.dart';

@JsonSerializable()
class CreateQuoteRequest {
  String author;
  String text;
  @JsonKey(name: 'hashtagIDs')
  List<String> hashtagIds;
  @JsonKey(name: 'photoID')
  String? photoId;
  @JsonKey(name: "stateID")
  String stateId;

  CreateQuoteRequest(
      {required this.author,
        required this.text,
        required this.hashtagIds,
        this.photoId,
        required this.stateId});

  factory CreateQuoteRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateQuoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateQuoteRequestToJson(this);
}
