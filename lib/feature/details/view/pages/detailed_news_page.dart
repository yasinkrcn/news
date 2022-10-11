import 'package:news/feature/home/domain/entities/list_news.dart';
import '../../../../core/_core_exports.dart';

class DetailedNewsPage extends StatelessWidget {
  const DetailedNewsPage({
    Key? key,
    required this.news,
  }) : super(key: key);
  final ListNews news;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            DetailsPageAppbar(
              url: news.urlToImage!,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.fromLTRB(10, height * 0.02, 10,0),
                  child: Column(
                    children: [
                      NewsTitleWidget(newsTitle: news.title),
                      if (news.description != null) ...[
                        const SizedBox(height: 15),
                        NewDescriptionWidget(description: news.description!),
                      ],
                      const SizedBox(height: 20),
                      GoNewsAndAuthorWidget(
                        newsURL: news.url,
                        author: news.author,
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
