import 'package:flutter/material.dart';
import 'package:news/core/utils/screen_size.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final int? itemCount;
  const ShimmerWidget({Key? key, this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(.05),
      highlightColor: Colors.black.withOpacity(.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemCount ?? 4,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: Container(height: 200, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Container(height: 25, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Container(
                        height: 25,
                        width: ScreenSize().getWidthPercent(.5),
                        color: Colors.black),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
