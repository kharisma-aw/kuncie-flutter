class HttpStatusCodeException<T> implements Exception {
  HttpStatusCodeException({required this.statusCode, this.data});

  final int statusCode;
  final T? data;

  @override
  String toString() {
    return 'HttpStatusCodeException: $statusCode';
  }
}

class ConnectionTimeoutException implements Exception {
  ConnectionTimeoutException();

  @override
  String toString() {
    return 'ConnectionTimeoutException';
  }
}

class NoConnectionException implements Exception {
  NoConnectionException();

  @override
  String toString() {
    return 'NoConnectionException';
  }
}

class UnknownException implements Exception {
  UnknownException(this.message);

  String? message;

  @override
  String toString() {
    return 'UnknownException: $message';
  }
}
