import '../../../../core/_core_exports.dart';

class BaseSearchPageDisplayWidget extends StatelessWidget {
  const BaseSearchPageDisplayWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverList(

      delegate: SliverChildListDelegate(
        
        [
        Center(child: child),
      ]),
    );
  }
}
