import 'dart:convert';

import 'package:data/api/dio.dart';
import 'package:domain/models/base/base_response.dart';
import 'package:domain/models/mappers/ui/id_value_mapper.dart';
import 'package:domain/models/mappers/ui/image_mapper.dart';
import 'package:domain/models/request/create_quote_request.dart';
import 'package:domain/models/response/hashtags_response.dart';
import 'package:domain/models/response/image_response.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/ui/id_value.dart';
import 'package:domain/models/ui/image.dart';
import 'package:domain/repositories/abstraction/publish_repository.dart';

class PublishRepositoryImpl extends PublishRepository {
  final DioClient _client;

  @override
  Stream<DomainResult> createQuote(String author, String body,
      List<String> hashtags, String photoId, String stateId) async* {
    try {
      yield DomainLoading();
      print(author);
      print(body);
      print(hashtags);
      print(photoId);
      if (author.trim().isEmpty ||
          body.isEmpty ||
          hashtags.isEmpty ||
          stateId.isEmpty) {
        yield DomainError(message: 'Заполните все данные !');
      } else if (photoId.isEmpty) {
        yield DomainError(message: 'Выберите рисунок !');
      } else {
        var response = await _client.post('v1/quote',
            data: CreateQuoteRequest(
                    author: author.trim(),
                    text: body.trim(),
                    hashtagIds: hashtags,
                    photoId: photoId,
                    stateId: stateId)
                .toJson());
        if (response.statusCode == 200) {
          yield DomainSuccess(message: "Цитата успешно создана !");
        } else {
          yield DomainError(message: 'Что то пошло не так...');
        }
      }
    } catch (e) {
      yield DomainError(message: "Что то пошло не так");
    }
  }

  @override
  Stream<DomainResult> getHashtags(int page) async* {
    try {
      yield DomainLoading();
      var response = await _client.get('v1/hashtags?page=$page');
      var decoded = BaseResponse<HashtagsResponse>.fromJson(
          jsonDecode(response.data), (p0) => HashtagsResponse.fromJson(p0));

      yield DomainSuccess<List<IdValue>>(
          data: decoded.data.data.map((e) => e.toUi()).toList());
    } catch (e) {
      yield DomainError(message: 'Что то пошло не так...');
    }
  }

  @override
  Stream<DomainResult> getImages() async* {
    try {
      yield DomainLoading();
      var response = await _client.get('v1/photos');
      var decoded = BaseResponse<ImagesResponse>.fromJson(
          jsonDecode(response.data), (p0) => ImagesResponse.fromJson(p0));

      yield DomainSuccess<List<QuoteImage>>(
          data: decoded.data.data.map((e) => e.toUi()).toList());
    } catch (e) {
      yield DomainError(message: 'Что то пошло не так...');
    }
  }

  PublishRepositoryImpl({
    required DioClient client,
  }) : _client = client;
}
