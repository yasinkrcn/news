import 'package:dartz/dartz.dart';
import 'package:news/core/error/failures/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
