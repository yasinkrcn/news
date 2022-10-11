import 'package:news/feature/home/data/model/list_news_model.dart';

class ListNews {
  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;
  ListNews({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
   required this.urlToImage,
    required this.publishedAt,
    this.content,
  });
}
