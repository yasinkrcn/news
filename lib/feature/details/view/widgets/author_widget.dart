import '../../../../core/_core_exports.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({
    Key? key,
    required this.author,
  }) : super(key: key);
  final String author;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          EnglishText.author,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: ScreenSize().screenSize.width * 0.3,
          child: Text(
            author,
            style: const TextStyle(fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
