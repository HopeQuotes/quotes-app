import 'package:json_annotation/json_annotation.dart';

part 'create_hashtag_request.g.dart';

@JsonSerializable()
class CreateHashtagRequest {
  String value;

  CreateHashtagRequest({
    required this.value,
  });

  Map<String, dynamic> toJson() => _$CreateHashtagRequestToJson(this);
}
