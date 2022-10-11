import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/core/constants/app_colors.dart';

import 'package:news/core/constants/category_list.dart';
import 'package:news/core/init/injection_container.dart';

import 'package:news/core/utils/screen_size.dart';
import 'package:news/feature/home/domain/entities/arguments/list_news_arguments.dart';

import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:news/feature/home/view_model/theme.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key, this.listNewsArguments}) : super(key: key);

  ListNewsArguments? listNewsArguments;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView(scrollDirection: Axis.vertical, children: [
            //TODO: grid view kullan

            Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(
                  kEntities.length,
                  (index) => GestureDetector(
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
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),

                  //  Container(
                  //   height: 175,
                  //   width: ScreenSize().getWidthPercent(.43),
                  //   decoration: BoxDecoration(
                  //        color: Colors.grey.shade700,
                  //       borderRadius: BorderRadius.circular(8)),
                  //   child: Column(
                  //     mainAxisAlignment:
                  //         MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       SvgPicture.asset(
                  //         kEntities[index].assethPath,
                  //         height: 75,
                  //       ),
                  //       Center(
                  //           child: Text(
                  //         kEntities[index].categoryName,
                  //         style: const TextStyle(
                  //             fontSize: 22, ),
                  //       )),
                  //     ],
                  //   ),
                  // ),
                )),
          ]));
    });
  }
}
