import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/core/constants/app_colors.dart';
import 'package:news/core/init/injection_container.dart';
import 'package:news/core/utils/screen_size.dart';
import 'package:news/feature/home/view/widgets/category_details_page_body.dart';
import 'package:news/feature/home/view/widgets/customize_sliver_app_bar.dart';
import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class CategoryDetailsPage extends StatefulWidget {
  const CategoryDetailsPage({Key? key}) : super(key: key);

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  @override
  void dispose() {
  

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().screenSize = MediaQuery.of(context).size;
//TODO: Selectoru body e ver

    return Scaffold(
      
      body: Selector<HomeProvider, ScrollController>(
          selector: (_, provider) => provider.controller,
          builder: (context, scrollController, child) {
            return CustomScrollView(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                const CustomizeSliverAppBar(),
                CupertinoSliverRefreshControl(
                  onRefresh: sl<HomeProvider>().refreshHomePage,
                ),
                const CategoryDetailsBody(),
              ],
            );
          }),
    );
  }
}
