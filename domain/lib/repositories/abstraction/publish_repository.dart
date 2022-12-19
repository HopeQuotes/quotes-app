

import '../../models/state/domain_result.dart';

abstract class PublishRepository {
  Stream<DomainResult> createQuote(String author, String body,
      List<String> hashtags, String photoId, String stateId);
  Stream<DomainResult> getHashtags(int page);
  Stream<DomainResult> getImages();

}