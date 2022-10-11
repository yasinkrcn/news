import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../core/_core_exports.dart';
import '../base_search_page_display_widget.dart';

//!
class SearchPageErrorBody extends StatelessWidget {
  const SearchPageErrorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSearchPageDisplayWidget(
      child: Text(
        EnglishText.searchPageProblemMessage,
        style: TextStyle(
          color: Colors.red,
          fontSize: ScreenSize().screenSize.width * 0.05,
        ),
      ),
    );
  }
}
