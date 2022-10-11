import 'package:news/core/utils/url_launcher_manager.dart';

import '../../../../core/_core_exports.dart';

class GoNewsAndAuthorWidget extends StatelessWidget {
  const GoNewsAndAuthorWidget({
    Key? key,
    this.author,
    required this.newsURL,
  }) : super(key: key);

  final String newsURL;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          // onTap: _openUrl,
          child: const Text(
            EnglishText.openNewsSource,
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ),
        if (author != null) AuthorWidget(author: author!),
      ],
    );
  }


  // _openUrl(){
  //   UrlLauncherManager().openURL(Uri.parse(newsURL)); //? bu olmadı gibi view model açıp içine koyayım mı?
  // }

}
