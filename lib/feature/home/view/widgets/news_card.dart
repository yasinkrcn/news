import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/utils/route/route_manager.dart';
import 'package:news/core/utils/route/router.dart';
import 'package:news/feature/home/data/model/list_news_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.article,
    required this.dateNow,
  }) : super(key: key);

  final ArticleModel article;
  final DateTime dateNow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        onTap: (() {
          Go.to.page(PageRoutes.topHeadlineDetailedNewsPage, arguments: article);
        }),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.5, color: Colors.grey)),
            // color: AppColors.newsCardColor,
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
                            return const SizedBox.shrink();
                          })),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  article.title,
                  style: const TextStyle(),
                ),
              ),

              //News Source İmages

              // SizedBox(

              //   child: CachedNetworkImage(
              //     fit: BoxFit.cover,
              //     errorWidget: (context, url, error) =>
              //           const SizedBox.shrink(),
              //     imageUrl: "https://logo.clearbit.com/${article.url.splitMapJoin(RegExp(r'^(?:https?:)?(?:\/\/)?(?:[^@\n]+@)?(?:www\.)?([^:\/\n]+)'),onMatch: (m) => '${m.group(0)}', onNonMatch: (n) => '').replaceAll('https://', '').replaceAll('http://', '').replaceAll('www.', '')}",
              //   ),
              //   // child: Image.network("https://icon-locator.herokuapp.com/icon?url=${n.url.splitMapJoin(RegExp(r'^.+?[^\/:](?=[?\/]|$)'),onMatch: (m) => '${m.group(0)}', onNonMatch: (n) => '')}&size=70..120..200")),
              // ),
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
  }
}