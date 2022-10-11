import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/core/constants/app_colors.dart';

import 'package:news/core/constants/category_list.dart';
import 'package:news/core/utils/screen_size.dart';
import 'package:news/feature/home/domain/entities/arguments/list_news_arguments.dart';
import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key, this.listNewsArguments}) : super(key: key);

  final ListNewsArguments? listNewsArguments;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: kEntities.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              provider.fetchNewsByCategory(index);
            },
            child: Stack(children: [
              SizedBox(
                width: ScreenSize().getWidthPercent(.43),
                height: 175,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    kEntities[index].assethPath,
                    height: 50,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: BlurryContainer(
                  blur: 5,
                  width: ScreenSize().getWidthPercent(.43),
                  height: 45,
                  elevation: 15,
                  color: Colors.transparent,
                  child: Center(
                    child: Text(
                      kEntities[index].categoryName,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                    ),
                  ),
                ),
              )
            ]),
          );
        }),
      );
    });
  }
}
