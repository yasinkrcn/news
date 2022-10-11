import 'package:news/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/feature/home/data/model/list_news_model.dart';
import 'package:news/feature/home/domain/repositories/i_home_repository.dart';
import '../entities/arguments/list_news_arguments.dart';

class FetchNewsDetailUsecase implements Usecase<ListNewsModel,ListNewsArguments>{

  final IHomeRepository iHomeRepository;

  FetchNewsDetailUsecase(this.iHomeRepository);
  @override
  Future<Either<Failure, ListNewsModel>> call(ListNewsArguments params) {
    return iHomeRepository.fetchNewsTopHeadlines(params);
  }

}