import '../../models/state/domain_result.dart';

abstract class HashtagRepository {
  Stream<DomainResult> createHashtag(String value);

  Stream<DomainResult> getHashtags(int page);
}
