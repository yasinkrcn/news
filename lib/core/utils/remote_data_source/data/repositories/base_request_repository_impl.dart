import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news/core/error/failures/base_response_status_failures.dart';
import 'package:news/core/utils/remote_data_source/_remote_data_source_exports.dart';
import '../../../../error/failures/failure.dart';

class BaseRequestRepositoryImpl implements IBaseRequestRepository {
  final Dio dio;

  BaseRequestRepositoryImpl({
    required this.dio,
  });

  @override
  Future<Either<Failure, String>> baseGet({
    required GetRequestParams params,
  }) {
    return _errorHandler(() {
      return dio.get(
        params.endPoint.path,
        queryParameters: params.queryparameters,

        // TODO: İnterceptor araştırılacak
      );
    });
  }

  Future<Either<Failure, String>> _errorHandler(
    final Future<Response> Function() requestFunction,
  ) async {
    Response dioResponse;
    try {
      dioResponse = await requestFunction();
      return Right(dioResponse.data) ;
      
    } on SocketException {
      return Left(NoInternetConnectionFailure());
    } on DioError catch (error) {
      return Left(getFailureByDioErrors(error));
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
