import 'package:dio/dio.dart';
import 'package:news/core/error/exceptions/general_exception.dart';
import 'package:news/core/error/failures/failure.dart';

class BadRequestFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnauthorizedFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ForbiddenFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NotFoundFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InternalFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class GatewayTimeOutFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NullPointerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class RequestHomeFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServiceMessageFailure extends Failure {
  static String message = "";
  @override
  List<Object?> get props => throw UnimplementedError();
}


class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure(this.reason);
  final String reason;
  @override
  List<Object?> get props => [];
}

class NoInternetConnectionFailure extends Failure {
  @override
  List<Object?> get props => [NoInternetConnectionException];
}

Failure getFailureByDioErrors(final DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return GatewayTimeOutFailure();
    case DioErrorType.sendTimeout:
      return GatewayTimeOutFailure();
    case DioErrorType.receiveTimeout:
      return GatewayTimeOutFailure();
    case DioErrorType.response:
      throw UnimplementedError(); //? failure dönmüyor?
    case DioErrorType.cancel:
      return RequestCancelledFailure(error.error);
    case DioErrorType.other:
      return NoInternetConnectionFailure();
  }
}
