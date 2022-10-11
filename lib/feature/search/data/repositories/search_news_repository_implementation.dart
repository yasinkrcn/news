import 'dart:convert';
import 'package:news/feature/search/data/models/news_list_model.dart';
import 'package:news/feature/search/domain/entities/news_list.dart';
import 'package:news/feature/search/domain/entities/arguments/get_news_with_keywords_param.dart';
import 'package:dartz/dartz.dart';
import 'package:news/feature/search/domain/repositories/search_news_repository.dart';
import '../../../../core/_core_exports.dart';

class SearchNewsRepositoryImplementation implements SearchNewsRepository {
  final MainBaseGetUsecase? mainBaseGetUsecase;
  SearchNewsRepositoryImplementation({this.mainBaseGetUsecase});

  @override
  Future<Either<Failure, NewsList>> getNewsListWithKeywords(
      GetNewsListWithKeywordsParam searchNewsParam) async {
    try {
      final searchListEither = await mainBaseGetUsecase!(
        GetRequestParams(
          queryparameters: searchNewsParam.toMap(),
          endPoint: MainEndpoints.everything,
        ),
      );

      return searchListEither.fold((failure) => Left(failure), (data) {
        NewsListModel _newsListModel = NewsListModel.fromJson(jsonDecode(data));

        return Right(_newsListModel);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
