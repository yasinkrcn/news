import 'package:dartz/dartz.dart';
import 'package:news/feature/search/domain/entities/news_list.dart';
import '../../../../core/error/failures/failure.dart';
import '../entities/arguments/get_news_with_keywords_param.dart';

abstract class SearchNewsRepository{
  Future<Either<Failure,NewsList>> getNewsListWithKeywords(GetNewsListWithKeywordsParam searchNewsParam);
}
