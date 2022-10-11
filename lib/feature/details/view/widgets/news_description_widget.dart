import '../../../../core/_core_exports.dart';

class NewDescriptionWidget extends StatelessWidget {
  const NewDescriptionWidget({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: const TextStyle(fontSize: 20,color: Colors.white),
      textAlign:TextAlign.justify,
    );
  }
}
