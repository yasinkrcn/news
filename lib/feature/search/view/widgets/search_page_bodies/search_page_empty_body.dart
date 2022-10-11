import 'package:news/feature/search/view/widgets/base_search_page_display_widget.dart';

import '../../../../../core/_core_exports.dart';

class SearchPageEmptyBody extends StatelessWidget {
  const SearchPageEmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSearchPageDisplayWidget(
      child: Column(
        children: [
          SvgPicture.asset(
            AssetsPath().searchStateEmptySVG,
            height: 250,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            EnglishText.searchSomething,
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
