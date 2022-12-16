import 'package:json_annotation/json_annotation.dart';

part 'id_value_data_response.g.dart';

@JsonSerializable()
class IdValueDataResponse {
  String id;
  String value;

  IdValueDataResponse({
    required this.id,
    required this.value,
  });

  factory IdValueDataResponse.fromJson(Map<String, dynamic> json) =>
      _$IdValueDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IdValueDataResponseToJson(this);
}
