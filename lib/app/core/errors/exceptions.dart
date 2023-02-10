part of 'errors.dart';

class BaseClientException implements Exception {
  BaseClientException(this.type);

  final BaseClientExceptionType type;

  @override
  String toString() {
    return 'BaseClientExceptionType: [type] -> $type';
  }
}

class BaseClientBadRequestException implements Exception {
  BaseClientBadRequestException(this.code);

  final String code;

  @override
  String toString() {
    return 'BaseClientBadRequestException: [code] -> $code';
  }
}
