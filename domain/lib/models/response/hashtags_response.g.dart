// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hashtags_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HashtagsResponse _$HashtagsResponseFromJson(Map<String, dynamic> json) =>
    HashtagsResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => IdValueDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HashtagsResponseToJson(HashtagsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
