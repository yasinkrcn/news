import 'package:news/feature/bottom_navigation_bar/domain/entities/bottom_navigation_bar_state.dart';

import '../../../../core/_core_exports.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  final Function() onTap;

  final bool isActive;
  final BottomNavigationBarState barState;

  const CustomBottomNavigationBarItem({
    Key? key,
    required this.onTap,
    this.isActive = false,
    required this.barState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: SizedBox(
              width: ScreenSize().getWidthPercent(.18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: ScreenSize().getWidthPercent(.055),
                    child: Icon(
                      barState.stateToIcon,
                      color: isActive
                          ? barState.stateToActiveColor()
                          : Colors.grey.shade700,
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Text(
                      barState.stateToTitle(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isActive
                            ? barState.stateToActiveColor()
                            : Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
