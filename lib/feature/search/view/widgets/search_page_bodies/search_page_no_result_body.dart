import 'package:news/feature/search/view/widgets/base_search_page_display_widget.dart';
import '../../../../../core/_core_exports.dart';

class SearchPageNoResultBody extends StatelessWidget {
  const SearchPageNoResultBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSearchPageDisplayWidget(
      child: Text(
        EnglishText.thereAreNoResult,
        style: TextStyle(
          color: Colors.white,
          fontSize: ScreenSize().screenSize.width * 0.05,
        ),
      ),
    );
  }
}
