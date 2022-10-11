
import 'package:news/core/keys/global_key.dart';
import 'package:news/feature/home/view/splash_page.dart';
import 'package:news/feature/home/view_model/theme.dart';
import 'package:provider/provider.dart';
import '/core/init/injection_container.dart' as sl;
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'core/constants/main_provider_list.dart';
import 'core/utils/route/router.dart';


void main() async {
  sl.init();
  timeago.setLocaleMessages('tr', timeago.TrMessages());
  runApp(MultiProvider(
      providers: MainProviderList.getMainProviderList(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: Provider.of<ThemeNotifier>(context).currentTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        navigatorKey: GlobalContextKey.instance.globalKey,
        // supportedLocales: const [
        //   Locale('tr', ''),
        //   Locale('en', ''),
        // ],
        home: const SplashPage());
  }
}
