import 'package:flutter/material.dart';
import 'package:news/core/constants/_constants_exports.dart';
import 'package:news/feature/home/view_model/theme.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final theme = Provider.of<ThemeNotifier>(context);
    return AppBar(
     
      centerTitle: true,
      elevation: 0,
      title:const Text('Search'),
      actions: [
        IconButton(
            splashRadius: 25.0,
            icon: theme.myTheme == MyTheme.light
                ? const Icon(
                    Icons.wb_sunny,
                  )
                : const Icon(Icons.dark_mode),
            onPressed: () => theme.switchTheme())
      ]
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
