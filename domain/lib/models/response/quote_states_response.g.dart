// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_states_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuoteStatesResponse _$QuoteStatesResponseFromJson(Map<String, dynamic> json) =>
    QuoteStatesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => QuoteStateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuoteStatesResponseToJson(
        QuoteStatesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
