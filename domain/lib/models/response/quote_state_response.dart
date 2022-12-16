import 'package:json_annotation/json_annotation.dart';

part 'quote_state_response.g.dart';

@JsonSerializable()
class QuoteStateResponse {
  String id;
  String value;
  bool idDefault;
  String color;

  QuoteStateResponse({
    required this.id,
    required this.value,
    required this.idDefault,
    required this.color,
  });

  factory QuoteStateResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteStateResponseFromJson(json);
}
