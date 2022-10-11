import 'package:news/feature/home/view_model/theme.dart';

import '../../../../core/_core_exports.dart';

class CustomizeSliverAppBar extends StatelessWidget {
  const CustomizeSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final theme = Provider.of<ThemeNotifier>(context);
    return SliverAppBar(
 
      floating: true,
      expandedHeight: 60,
      flexibleSpace: FlexibleSpaceBar(
        title: SvgPicture.asset(
          AssetsPath().logoSVG,
          height: 25,
        ),
        centerTitle: true,
      ),
      actions: [
        IconButton(
            splashRadius: 25.0,
            icon: theme.myTheme == MyTheme.light
                ? const Icon(
                    Icons.wb_sunny,
                  )
                : const Icon(Icons.dark_mode),
            onPressed: () => theme.switchTheme())
      ],
    );
  }
}
