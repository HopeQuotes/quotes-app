abstract class DomainResult {}

class DomainResultSuccess<T> extends DomainResult {
  T? data;
  String? message;

  DomainResultSuccess({this.data, this.message});
}

class DomainResultFail<T> extends DomainResult {
  T? data;
  String? message;

  DomainResultFail({this.data, this.message});
}

class DomainResultLoading extends DomainResult {}
