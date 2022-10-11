import '../../../../core/_core_exports.dart';

class NewsTitleWidget extends StatelessWidget {
  const NewsTitleWidget({
    Key? key,
    required this.newsTitle,
  }) : super(key: key);

  final String newsTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      newsTitle,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      softWrap: true,
      textAlign: TextAlign.center,
    );
  }
}
