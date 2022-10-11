import '../_core_exports.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key? key,
    this.color = Colors.white,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
    );
  }
}
