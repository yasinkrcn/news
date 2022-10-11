import '../../../../core/_core_exports.dart';

class DetailsPageAppbar extends StatelessWidget {
  const DetailsPageAppbar({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      floating: true,
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
