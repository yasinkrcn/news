import 'package:news/feature/search/domain/entities/news.dart';

class NewsModel extends News {
  NewsModel({
    String? author,
    String? description,
    String? content,
    String? urlToImage,
    required String title,
    required String url,
    required DateTime publishedAt,
  }) : super(
          author: author,
          description: description,
          content: content,
          urlToImage: urlToImage,
          title: title,
          url: url,
          publishedAt: publishedAt,
        );

  NewsModel.fromJson(Map<String, dynamic> json)
      : super(
          author: json["author"],
          description: json["description"],
          content: json["content"],
          urlToImage: json["urlToImage"],
          title: json["title"] ?? '',
          url: json["url"],
          publishedAt: DateTime.parse(json["publishedAt"]),
        );

  Map<String, dynamic> get toJson => <String, dynamic>{
        "author": author,
        "description": description,
        "content": content,
        "urlToImage": urlToImage,
        "title": title,
        "url": url,
        "publishedAt": publishedAt.toIso8601String,
      };
}
