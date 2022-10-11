import 'enums/status_enums.dart';
import 'news.dart';

class NewsList {
  final Status status;
  final int totalResult;
  final List<News> news;

  NewsList({
    required this.status,
    required this.totalResult,
    required this.news,
  });
}
