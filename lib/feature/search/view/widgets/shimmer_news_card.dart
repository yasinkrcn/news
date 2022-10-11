import '../../../../core/_core_exports.dart';

class ShimmerNewsCard extends StatelessWidget {
  const ShimmerNewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Container(height: 25, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              height: 25,
              width: ScreenSize().getWidthPercent(.5),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
