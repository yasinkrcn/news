import '../../../../core/_core_exports.dart';

class NewsImageWidget extends StatelessWidget {
  const NewsImageWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Image.network(
        url,
        fit: BoxFit.contain,
      ),
    );
  }
}
