import 'package:json_annotation/json_annotation.dart';

part 'set_quote_state_request.g.dart';

@JsonSerializable()
class SetQuoteStateRequest {
  String id;
  String stateId;

  SetQuoteStateRequest({
    required this.id,
    required this.stateId,
  });

  Map<String, dynamic> toJson() => _$SetQuoteStateRequestToJson(this);
}
