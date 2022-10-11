import 'package:news/feature/search/view/widgets/shimmer_news_card.dart';
import '../../../../../core/_core_exports.dart';

class SearchPageLoadingBody extends StatelessWidget {
  const SearchPageLoadingBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Shimmer.fromColors(
          baseColor: Colors.black.withOpacity(.05),
          highlightColor: Colors.black.withOpacity(.5),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: const [
                  ShimmerNewsCard(),
                  ShimmerNewsCard(),
                  ShimmerNewsCard(),
                  ShimmerNewsCard(),
                  ShimmerNewsCard(),
                ],
              )),
        ),
      ]),
    );
  }
}
