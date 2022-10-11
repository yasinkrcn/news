import 'package:news/feature/bottom_navigation_bar/_bottom_navigation_bar_exports.dart';
import 'package:news/feature/bottom_navigation_bar/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:news/feature/bottom_navigation_bar/view_model/bottom_navigation_bar_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> with RouteAware {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Consumer(
        builder: (BuildContext context, BottomNavigationBarProvider provider, Widget? child) {
          return Scaffold(
            appBar: provider.selectedBarState.buildAppBar(),
           
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: provider.selectedBarState.buildBody(),
          );
        },
      ),
    );
  }
}
