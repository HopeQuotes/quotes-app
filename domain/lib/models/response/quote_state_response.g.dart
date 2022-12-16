// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_state_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteStateResponse _$QuoteStateResponseFromJson(Map<String, dynamic> json) =>
    QuoteStateResponse(
      id: json['id'] as String,
      value: json['value'] as String,
      idDefault: json['idDefault'] as bool,
      color: json['color'] as String,
    );

Map<String, dynamic> _$QuoteStateResponseToJson(QuoteStateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idDefault': instance.idDefault,
      'color': instance.color,
    };
