import 'package:news/feature/bottom_navigation_bar/domain/entities/bottom_navigation_bar_state.dart';



abstract class BottomNavigationInfoRepository {
  void routePage(BottomNavigationBarState pageState);
}
