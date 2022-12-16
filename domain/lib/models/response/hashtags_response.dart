import 'package:json_annotation/json_annotation.dart';

import '../id_value_data_response.dart';

part 'hashtags_response.g.dart';

@JsonSerializable()
class HashtagsResponse {
  List<IdValueDataResponse> data;

  HashtagsResponse({
    required this.data,
  });

  factory HashtagsResponse.fromJson(Map<String, dynamic> json) =>
      _$HashtagsResponseFromJson(json);
}
