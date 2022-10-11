import 'package:dartz/dartz.dart';
import '../../../../core/error/failures/failure.dart';
import '../../data/model/list_news_model.dart';
import '../entities/arguments/list_news_arguments.dart';

abstract class IHomeRepository {
  Future<Either<Failure, ListNewsModel>> fetchNewsTopHeadlines(ListNewsArguments arguments);
}
