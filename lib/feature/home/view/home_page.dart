import 'package:flutter/cupertino.dart';
import 'package:news/feature/home/view/widgets/home_page_body.dart';
import 'package:news/feature/home/view/widgets/customize_sliver_app_bar.dart';
import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:news/feature/home/view_model/theme.dart';
import '../../../core/_core_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  onRefresh: ()async {
                  await  sl<HomeProvider>().refreshHomePage();
                  }
                ),
                const HomePageBody(),
              ],
            );
          }),
    );
  }
}
