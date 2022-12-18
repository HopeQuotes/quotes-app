import 'dart:convert';

import 'package:data/api/dio.dart';
import 'package:domain/models/base/base_response.dart';
import 'package:domain/models/mappers/ui/quote_mapper.dart';
import 'package:domain/models/response/quote_response.dart';
import 'package:domain/models/state/domain_result.dart';
import 'package:domain/models/ui/quote.dart';
import 'package:domain/repositories/abstraction/full_screen_quote_repository.dart';

class FullScreenQuoteRepositoryImpl extends FullScreenQuoteRepository {
  final DioClient _client;

  @override
  Stream<DomainResult> getQuotes(int page) async* {
    try {
      yield DomainLoading();
      var response = await _client.get('v1/quotes?page=$page');
      var decoded = BaseResponse<QuotesResponse>.fromJson(
          jsonDecode(response.data), (p0) => QuotesResponse.fromJson(p0));

      yield DomainSuccess<List<Quote>>(
          data: decoded.data.data.map((e) => e.toUi()).toList());
    } catch (e) {
      yield DomainError(message: 'Something went wrong...');
    }
  }

  FullScreenQuoteRepositoryImpl({
    required DioClient client,
  }) : _client = client;
}
