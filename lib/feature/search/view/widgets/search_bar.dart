import 'package:news/feature/search/view_model/search_provider.dart';
import '../../../../core/_core_exports.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: SizedBox(
            height: 46,
            child: Consumer<SearchProvider>(builder: (context, searchProvider, child) {
              return TextFormField(
                textInputAction: TextInputAction.search,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.search),
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(24)),
                    hintText: EnglishText.searchNews),
                controller: searchProvider.searchBarController,
                onChanged: searchProvider.searchArticles,
              );
            },
              
            ),
          ),
        ),
      ]),
    );
  }
}


