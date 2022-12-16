// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_quote_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateQuoteRequest _$CreateQuoteRequestFromJson(Map<String, dynamic> json) =>
    CreateQuoteRequest(
      author: json['author'] as String,
      text: json['text'] as String,
      hashtagIds: (json['hashtagIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      photoId: json['photoID'] as String?,
    );

Map<String, dynamic> _$CreateQuoteRequestToJson(CreateQuoteRequest instance) =>
    <String, dynamic>{
      'author': instance.author,
      'text': instance.text,
      'hashtagIDs': instance.hashtagIds,
      'photoID': instance.photoId,
    };
