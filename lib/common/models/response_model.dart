import 'package:news_app/common/error/error_model.dart';

sealed class Response<T> {
  Response();
}

class SuccessResponse<T> extends Response<T> {
  final T data;
  SuccessResponse({required this.data});
}

class ErrorResponse<T> extends Response<T> {
  final ErrorModel errorModel;
  ErrorResponse({required this.errorModel});
}
