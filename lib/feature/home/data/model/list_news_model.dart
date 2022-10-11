import 'dart:convert';
import 'package:news/feature/home/domain/entities/list_news.dart';

ListNewsModel newsFromJson(String str) => ListNewsModel.fromJson(json.decode(str));
String newsToJson(ListNewsModel data) => json.encode(data.toJson());

class ListNewsModel {
  ListNewsModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<ArticleModel> articles;

  factory ListNewsModel.fromJson(Map<String, dynamic> json) => ListNewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<ArticleModel>.from(
            json["articles"].map((x) => ArticleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class ArticleModel extends ListNews {
  ArticleModel({
    //TODO: requiradlar bi yere diğerleri bi yere
    required Source source,
    String? author,
    required String title,
    String? description,
    required String url,
    required String urlToImage,
    required DateTime publishedAt,
    String? content,
  }) : super(
          source: source,
          author: author,
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] ?? '',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  final dynamic id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
