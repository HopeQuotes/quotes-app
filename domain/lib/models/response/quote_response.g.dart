// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotesResponse _$QuotesResponseFromJson(Map<String, dynamic> json) =>
    QuotesResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => QuoteResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuotesResponseToJson(QuotesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

QuoteResponse _$QuoteResponseFromJson(Map<String, dynamic> json) =>
    QuoteResponse(
      id: json['id'] as String,
      state: QuoteStateResponse.fromJson(json['state'] as Map<String, dynamic>),
      author: json['author'] as String,
      text: json['text'] as String,
      hashtags: (json['hashtags'] as List<dynamic>)
          .map((e) => IdValueDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$QuoteResponseToJson(QuoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'author': instance.author,
      'text': instance.text,
      'hashtags': instance.hashtags,
    };
