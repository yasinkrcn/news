import 'package:flutter/cupertino.dart';
import 'package:news/feature/bottom_navigation_bar/view/pages/_pages_exports.dart';
import 'package:news/feature/details/view/pages/detailed_news_page.dart';
import 'package:news/feature/home/data/model/list_news_model.dart';
import 'package:news/feature/home/view/category_details_page.dart';
import 'package:news/feature/home/view/home_page.dart';
import 'package:news/feature/home/view/widgets/top_headlines_details_page.dart';

class PageRoutes {
  static const String homePage = "/homePage";
  static const String topHeadlineDetailedNewsPage =
      "/topHeadlineDetailedNewsPage";
  static const String detailedNewsPage = "/detailedNewsPage";
  static const String categoryDetailsPage = "/categoryDetailsPage";

  static const String bottomNavigationPage = "/bottomNavigationPage";
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PageRoutes.homePage:
      return CupertinoPageRoute(builder: (_) => const HomePage());
    case PageRoutes.bottomNavigationPage:
      return CupertinoPageRoute(builder: (_) => const BottomNavigationPage());

    case PageRoutes.categoryDetailsPage:
      return CupertinoPageRoute(builder: (_) => const CategoryDetailsPage());
    case PageRoutes.topHeadlineDetailedNewsPage:
      final ArticleModel article = settings.arguments as ArticleModel;
      return CupertinoPageRoute(
          builder: (_) => TopHeadlineDetailsPage(
                article: article,
              ));

    default:
      return CupertinoPageRoute(builder: (_) => const HomePage());
  }
}
