import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures/failure.dart';
import 'package:news/core/utils/remote_data_source/domain/repositories/i_base_request_repository.dart';

import '../../../../usecases/usecase.dart';
import '../entities/get_request_params.dart';

class MainBaseGetUsecase implements Usecase<String, GetRequestParams> {
  final IBaseRequestRepository repository;
  MainBaseGetUsecase(this.repository);

  @override
  Future<Either<Failure, String>> call(GetRequestParams params) {
    return repository.baseGet(params: params);
  }
}
