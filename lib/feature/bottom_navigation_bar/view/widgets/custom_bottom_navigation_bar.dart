// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:news/feature/bottom_navigation_bar/domain/entities/bottom_navigation_bar_state.dart';
import 'package:news/feature/bottom_navigation_bar/view/widgets/bottom_navigation_bar_item.dart';
import 'package:news/feature/bottom_navigation_bar/view_model/bottom_navigation_bar_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/_core_exports.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, BottomNavigationBarProvider provider, Widget? widget) {
        return AnimatedContainer(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: ScreenSize().getHeightPercent(.0)),
          height: provider.isBottomBarVisible ? 55 : 0,
          width: ScreenSize().getWidthPercent(1),
          decoration: const BoxDecoration(
            
          ),
          curve: Curves.linear,
          duration: const Duration(
            milliseconds: 250,
          ),
          child: SingleChildScrollView(
            child: Container(
              height: 55,
              width: ScreenSize().getWidthPercent(1),
              color: Colors.transparent,
              child: Stack(
                children: [
                  SizedBox(
                    width: ScreenSize().getWidthPercent(1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (BottomNavigationBarState state in BottomNavigationBarState.values)
                          CustomBottomNavigationBarItem(
                            onTap: () {
                              provider.routePage(state);
                            },
                            isActive: provider.selectedBarState == state,
                            barState: state,
                          ),
                      ],
                    ),
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(
                      begin: 0,
                      end: ((ScreenSize().getWidthPercent(1) / BottomNavigationBarState.values.length) *
                          provider.selectedBarState.stateToPageIndex()),
                    ),
                    curve: Curves.easeOutQuint,
                    duration: const Duration(milliseconds: 350),
                    builder: (context, animation, _) {
                      return Positioned(
                        bottom: 0,
                        left: animation,
                        child: Container(
                          height: ScreenSize().getHeightPercent(.005),
                          width: ((ScreenSize().getWidthPercent(1)) / BottomNavigationBarState.values.length),
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Container(
                            width: ScreenSize().getWidthPercent(.33),
                            color: Colors.blue,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            physics: const NeverScrollableScrollPhysics(),
          ),
        );
      },
    );
  }
}
