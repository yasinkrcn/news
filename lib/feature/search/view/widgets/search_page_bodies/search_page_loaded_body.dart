import '../../../../../core/_core_exports.dart';
import '../../../domain/entities/news.dart';
import '../../../view_model/search_provider.dart';
import '../news_card.dart';

class LoadedSearchPageBody extends StatelessWidget {
  const LoadedSearchPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (BuildContext context, SearchProvider value, Widget? child) {
        List<News> newsList = value.searchedNewsList;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return NewsCard(news: newsList[index]);
            },
            childCount: newsList.length,
          ),
        );
      },
    );
  }
}