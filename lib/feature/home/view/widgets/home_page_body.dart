import 'package:news/core/_core_exports.dart';
import 'package:news/feature/home/view/widgets/news_card.dart';
import 'package:news/feature/home/view/widgets/shimmer_widget.dart';
import 'package:news/feature/home/view_model/home_provider.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return homeProvider.articles.isEmpty
            ? const SliverToBoxAdapter(
                child: ShimmerWidget(),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final article = homeProvider.articles[index];
                    DateTime dateNow = article.publishedAt;
                    return NewsCard(article: article, dateNow: dateNow);
                  },
                  childCount: homeProvider.articles.length,
                ),
              );
      },
    );
  }
}
