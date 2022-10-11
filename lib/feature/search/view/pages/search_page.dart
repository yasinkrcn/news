import 'package:news/core/_core_exports.dart';
import 'package:news/core/functions/remove_focus.dart';
import 'package:news/feature/search/view_model/search_provider.dart';

import '../widgets/search_bar.dart';
import '../widgets/search_page_body.dart';

class SearchPage extends StatefulWidget {
  //?stateful oldu?
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    sl<SearchProvider>().onInit();
    super.initState();
  }

  @override
  void dispose() {
   
    super.dispose();
     sl<SearchProvider>().onDispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size; //!burda olmamalı
    return Scaffold(
      body: GestureDetector(
        onTap: () {
        removeFocus(context);
      },
        child: CustomScrollView(
          controller: sl<SearchProvider>().controller,
          slivers: const [
            //add sliver app bar
            SearchBar(),
            SearchPageBody(),
          ],
        ),
      ),
    );
  }
}
