import 'package:news/feature/search/data/models/news_model.dart';
import 'package:news/feature/search/domain/entities/news.dart';
import '../../domain/entities/enums/status_enums.dart';
import '../../domain/entities/news_list.dart';

class NewsListModel extends NewsList {
  NewsListModel({
    required Status status,
    required int totalResult,
    required List<News> news,
  }) : super(status: status, totalResult: totalResult, news: news);

  NewsListModel.fromJson(Map<String, dynamic> json)
      : super(
          status: Status.ok ,//?json["status"] stringToStatus'u nasıl handle etmeliyim
          totalResult: json["totalResults"],
          news: json["articles"].map<NewsModel>((json) => NewsModel.fromJson(json)).toList(),
        );
}