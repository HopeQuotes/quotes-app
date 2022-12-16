import 'dart:convert';
import 'package:data/api/dio.dart';
import 'package:domain/models/base/base_response.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/repositories/abstraction/hashtag_repository.dart';
import 'package:domain/models/request/create_hashtag_request.dart';
import 'package:domain/models/response/hashtags_response.dart';
import 'package:domain/models/ui/id_value.dart';
import 'package:domain/models/mappers/ui/id_value_mapper.dart';

class HashtagRepositoryImpl extends HashtagRepository {
  final DioClient _client;

  @override
  Stream<DomainResult> createHashtag(String value) async* {
    try {
      yield DomainLoading();
      if (value.trim().isEmpty) {
        yield DomainError(message: 'Invalid input.');
      } else {
        var response = await _client.post('v1/hashtag',
            data: CreateHashtagRequest(value: value).toJson());

        if (response.isSuccessful)
          yield DomainSuccess(message: "Succussfully created !");
      }
    } catch (e) {
      yield DomainError(message: 'Something went wrong...');
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
      yield DomainError(message: 'Something went wrong...');
    }
  }

  HashtagRepositoryImpl({
    required DioClient client,
  }) : _client = client; //
}
