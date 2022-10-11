import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures/failure.dart';
import 'package:news/core/utils/remote_data_source/_remote_data_source_exports.dart';

abstract class IBaseRequestRepository {
  Future<Either<Failure, String>> baseGet({
    required GetRequestParams params,
  });
}
