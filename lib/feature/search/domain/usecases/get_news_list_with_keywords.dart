import 'package:news/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news/core/usecases/usecase.dart';
import 'package:news/feature/search/domain/entities/arguments/get_news_with_keywords_param.dart';
import 'package:news/feature/search/domain/entities/news_list.dart';
import 'package:news/feature/search/domain/repositories/search_news_repository.dart';

class GetNewsListWithKeywords implements Usecase<NewsList,GetNewsListWithKeywordsParam>{
  final SearchNewsRepository _searchNewsRepository;
  GetNewsListWithKeywords(this._searchNewsRepository);

  @override
  Future<Either<Failure, NewsList>> call(GetNewsListWithKeywordsParam param) {
    return _searchNewsRepository.getNewsListWithKeywords(param);
  }
}