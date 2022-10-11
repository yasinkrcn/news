import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/core/_package_exports.dart';
import 'package:news/core/constants/_constants_exports.dart';
import 'package:news/core/utils/_utils_exports.dart';
import 'package:news/feature/home/view/widgets/shimmer_widget.dart';
import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) {
        return SliverToBoxAdapter(
          child: homeProvider.articles.isEmpty
              ? const ShimmerWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: homeProvider.articles.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final article = homeProvider.articles[index];
                    DateTime dateNow = article.publishedAt;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: GestureDetector(
                        onTap: (() {
                          Go.to.page(PageRoutes.topHeadlineDetailedNewsPage,
                              arguments: article);
                        }),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.grey)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                child: article.urlToImage == null
                                    ? Image.network(
                                        'https://flutterdesk.com/wp-content/uploads/2022/05/Flutter-3.0.jpg')
                                    : CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: article.urlToImage!,
                                        errorWidget: (context, url, error) {
                                          return const Icon(Icons.error);
                                        }),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  article.title,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  timeago.format(dateNow, locale: 'tr'),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
        );
      },
    );
  }
}
