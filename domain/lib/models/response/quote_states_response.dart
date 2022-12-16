import 'package:domain/models/response/quote_state_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quote_states_response.g.dart';

@JsonSerializable()
class QuoteStatesResponse {
  List<QuoteStateResponse> data;

  QuoteStatesResponse({
    required this.data,
  });

  factory QuoteStatesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteStatesResponseFromJson(json);
}
