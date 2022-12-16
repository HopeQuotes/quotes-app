// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_quote_state_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetQuoteStateRequest _$SetQuoteStateRequestFromJson(
        Map<String, dynamic> json) =>
    SetQuoteStateRequest(
      id: json['id'] as String,
      stateId: json['stateId'] as String,
    );

Map<String, dynamic> _$SetQuoteStateRequestToJson(
        SetQuoteStateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'stateId': instance.stateId,
    };
