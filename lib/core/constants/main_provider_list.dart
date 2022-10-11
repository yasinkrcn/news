import 'package:news/core/init/injection_container.dart';
import 'package:news/feature/bottom_navigation_bar/view_model/bottom_navigation_bar_provider.dart';

import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:news/feature/home/view_model/theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../../feature/home/view_model/home_provider.dart';
import '../../feature/search/view_model/search_provider.dart';
import '../_core_exports.dart';

class MainProviderList {
  /// This list includes providers that should stand up when the application starts.
  static List<SingleChildWidget> mainProviderlist = [
    ChangeNotifierProvider(create: (_) => sl<HomeProvider>()),
    ChangeNotifierProvider(create: (_) => sl<SearchProvider>()),
    ChangeNotifierProvider(create: (_) => sl<BottomNavigationBarProvider>()),
    ChangeNotifierProvider(create: (_) => sl<ThemeNotifier>()),
  
  ];

  /// This method returns the provider list that should stand up at the beginning of the application.
  static List<SingleChildWidget> getMainProviderList() {
    return mainProviderlist;
  }
}
