import 'package:dartz/dartz.dart';
import 'package:news/core/_core_exports.dart';
import 'package:news/feature/search/domain/entities/arguments/get_news_with_keywords_param.dart';
import '../domain/entities/news.dart';
import '../domain/entities/news_list.dart';
import '../domain/usecases/get_news_list_with_keywords.dart';
import 'package:async/async.dart';

enum SearchState {
  loaded,
  error,
  empty,
  noResult,
  searching,
} //? bunları nereye almalıyım

//? scrollstates kontrol edilebilir

class SearchProvider extends ChangeNotifier {
  final GetNewsListWithKeywords getNewsListWithKeywords;
  SearchProvider({required this.getNewsListWithKeywords});

  final int pageSize = 5;

  SearchState searchState = SearchState.empty;

  TextEditingController searchBarController =
      TextEditingController(); //?bunun yerine onchanged'den güncelleyebilirim
  ScrollController? controller;

  CancelableOperation? searchStarterCancelableFuture;

  List<News> searchedNewsList = [];
  int nextPage = 1;
  int totalResult = 0;

  int get totalPage => (totalResult / pageSize).ceil();

  Future<void> onInit() async {
    controller = ScrollController();
    await loadingController();
  }

  void onDispose() {
    controller?.removeListener(() {});
    controller?.dispose();
  }

  //controller
  Future<void> loadingController() async {
    controller!.addListener(() {
      if (controller!.position.maxScrollExtent == controller!.position.pixels) {
        loadSearchedNews();
      }
    });
  }

  Future<void> searchArticles(String? keyword) async {
    if (searchBarController.text.isEmpty) {
      _setSearchState(SearchState.empty);
    }

    if (keyword != null && keyword.isNotEmpty) {
      if (searchStarterCancelableFuture != null) {
        await searchStarterCancelableFuture!.cancel();
      }

      searchStarterCancelableFuture = CancelableOperation.fromFuture(
        Future.delayed(
          const Duration(milliseconds: 500),
          () {},
        ),
      );
      await searchStarterCancelableFuture!.value.whenComplete(searchNews);
      print('arama yapildi');
    }
  }

  //? isimlendirme
  Future<void> loadSearchedNews() async {
    if (nextPage > totalPage) return null;

    final Either<Failure, NewsList> newsEither = await _getNews();
    newsEither.fold(
      (failure) {
        //!
      },
      (newsList) {
        if (newsList.news.isNotEmpty) {
          searchedNewsList.addAll(newsList.news);
          nextPage++;
          notifyListeners();
        } else {
          //!
        }
      },
    );
  }

  Future<void> searchNews() async {
    //! async üzerinde çalışmam lazım
    _setSearchState(SearchState.searching);
    nextPage = 1;

    final Either<Failure, NewsList> newsEither = await _getNews();
    searchedNewsList.clear();

    newsEither.fold(
      (failure) {
        _setSearchState(SearchState.error);
      },
      (newsList) {
        if (newsList.news.isNotEmpty) {
          searchedNewsList.addAll(newsList.news);
          totalResult = newsList.totalResult;
          nextPage++;
          _setSearchState(SearchState.loaded);
        } else {
          _setSearchState(SearchState.noResult);
        }
      },
    );
    print('$searchState + ${searchBarController.text} ');
  }

  //common func
  Future<Either<Failure, NewsList>> _getNews() async {
    return getNewsListWithKeywords(
      GetNewsListWithKeywordsParam(
        keyword: searchBarController.text,
        pageSize: pageSize,
        page: nextPage,
      ),
    );
  }

  void _setSearchState(SearchState newPageState) {
    searchState = newPageState;
    notifyListeners();
  }
}
