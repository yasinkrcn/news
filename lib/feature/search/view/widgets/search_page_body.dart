import 'package:news/feature/search/view/widgets/search_page_bodies/search_page_empty_body.dart';
import 'package:news/feature/search/view/widgets/search_page_bodies/search_page_loaded_body.dart';
import 'package:news/feature/search/view/widgets/search_page_bodies/search_page_loading_body.dart';
import 'package:news/feature/search/view/widgets/search_page_bodies/search_page_error_body.dart';
import 'package:news/feature/search/view_model/search_provider.dart';
import '../../../../core/_core_exports.dart';
import 'search_page_bodies/search_page_no_result_body.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<SearchProvider, SearchState>(
      selector: (BuildContext context, SearchProvider provider) {
        return provider.searchState;
      },
      builder: (BuildContext context, SearchState pageState, Widget? child) {
        switch (pageState) {
          case SearchState.loaded:
            return const LoadedSearchPageBody();

           

          case SearchState.error:
            return const SearchPageErrorBody();

          case SearchState.empty:
            return const SearchPageEmptyBody();

          case SearchState.noResult:
            return const SearchPageNoResultBody();

          case SearchState.searching:
            // return const SearchPageLoadingBody();
             return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
