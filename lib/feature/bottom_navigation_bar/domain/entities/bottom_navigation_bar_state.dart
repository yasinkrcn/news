// ignore_for_file: constant_identifier_names

import 'package:news/feature/home/view/category_page.dart';
import 'package:news/feature/home/view/home_page.dart';
import 'package:news/feature/home/view/widgets/category_app_bar.dart';
import 'package:news/feature/search/view/pages/search_page.dart';
import 'package:news/feature/search/view/widgets/search_app_bar.dart';

import '../../../../core/_core_exports.dart';

enum BottomNavigationBarState { HOME, CATEGORY, SEARCH }

extension BottomNavigationBarStateExtension on BottomNavigationBarState {
  int stateToPageIndex() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 0;
      case BottomNavigationBarState.CATEGORY:
        return 1;
      case BottomNavigationBarState.SEARCH:
        return 2;
    }
  }

  BottomNavigationBarState indexToState(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return BottomNavigationBarState.HOME;
      case 1:
        return BottomNavigationBarState.CATEGORY;
      case 2:
        return BottomNavigationBarState.SEARCH;

      default:
        throw BottomNavigationBarState.HOME;
    }
  }

  Color stateToActiveColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
      case BottomNavigationBarState.CATEGORY:

      case BottomNavigationBarState.SEARCH:
        return Colors.blue;
    }
  }

  Color stateToDeActiveColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
      case BottomNavigationBarState.CATEGORY:

      case BottomNavigationBarState.SEARCH:
        return Colors.grey;
    }
  }

  String stateToTitle() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return 'Home';
      case BottomNavigationBarState.CATEGORY:
        return 'Category';
      case BottomNavigationBarState.SEARCH:
        return 'Search';
    }
  }

  IconData get stateToIcon {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return Icons.home;
      case BottomNavigationBarState.CATEGORY:
        return Icons.category;
      case BottomNavigationBarState.SEARCH:
        return Icons.search;
    }
  }

  Widget buildBody() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return const HomePage();
      case BottomNavigationBarState.CATEGORY:
        return CategoryPage();
      case BottomNavigationBarState.SEARCH:
        return const SearchPage();
    }
  }

  PreferredSizeWidget? buildAppBar() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return null;

      case BottomNavigationBarState.CATEGORY:
        return const CategoryAppBar();

      case BottomNavigationBarState.SEARCH:
        return const SearchAppBar();
    }
  }

  Color pageBackGroundColor() {
    switch (this) {
      case BottomNavigationBarState.HOME:
        return AppColors.backgroundColor;
      case BottomNavigationBarState.CATEGORY:
        return AppColors.backgroundColor;
      case BottomNavigationBarState.SEARCH:
        return AppColors.backgroundColor;
    }
  }
}
