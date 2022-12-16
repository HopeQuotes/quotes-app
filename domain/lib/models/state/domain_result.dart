class DomainResult {}

class DomainSuccess<T> extends DomainResult {
  T? data;
  String? message;

  DomainSuccess({
    this.data,
    this.message,
  });
}

class DomainError extends DomainResult {
  String? message;

  DomainError({
    this.message,
  });
}

class DomainLoading extends DomainResult {}
