import 'package:news/feature/home/data/model/list_news_model.dart';
import 'package:news/feature/home/view/widgets/custom_web_view.dart';
import 'package:news/feature/home/view_model/theme.dart';
import '../../../../core/_core_exports.dart';

class TopHeadlineDetailsPage extends StatelessWidget {
  final ArticleModel article;
  const TopHeadlineDetailsPage({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
          title: SvgPicture.asset(
            AssetsPath().logoSVG,
            height: 48,
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                splashRadius: 25.0,
                icon: theme.myTheme == MyTheme.light
                    ? const Icon(
                        Icons.wb_sunny,
                      )
                    : const Icon(Icons.dark_mode),
                onPressed: () => theme.switchTheme())
          ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(article.urlToImage!, fit: BoxFit.cover,
                errorBuilder: (context, object, stackTrace) {
              return const SizedBox.shrink();
            }),
            const SizedBox(
              height: 8,
            ),
            Text(
              article.description ?? '',
            ),
            const SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CustomWebview(url: article.url),
                ),
              ),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 42, 119, 196),
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                    child: Text(
                  'Detaylar için tıklayınız.',
                  style: TextStyle(
                      // color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
