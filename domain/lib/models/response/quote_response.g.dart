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
      photo: QuoteImageResponse.fromJson(json['photo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuoteResponseToJson(QuoteResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': instance.state,
      'author': instance.author,
      'text': instance.text,
      'hashtags': instance.hashtags,
      'photo': instance.photo,
    };

QuoteImageResponse _$QuoteImageResponseFromJson(Map<String, dynamic> json) =>
    QuoteImageResponse(
      id: json['id'] as String,
      color: json['color'] as String,
      blurHash: json['blurHash'] as String,
      author: json['author'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$QuoteImageResponseToJson(QuoteImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'color': instance.color,
      'blurHash': instance.blurHash,
      'author': instance.author,
      'url': instance.url,
    };
