import 'package:news/core/_core_exports.dart';
import 'package:news/core/constants/category_list.dart';
import 'package:news/core/init/injection_container.dart';
import 'package:news/feature/home/data/model/list_news_model.dart';
import 'package:news/feature/home/domain/entities/arguments/list_news_arguments.dart';
import 'package:news/feature/home/domain/usecases/fetch_news_detail_usecase.dart';
import 'package:news/feature/home/view/category_page.dart';
import 'package:news/feature/home/view_model/theme.dart';

class HomeProvider extends ChangeNotifier {
  final FetchNewsDetailUsecase _fetchNewsDetailUsecase;

  HomeProvider(this._fetchNewsDetailUsecase) {
    homeApiCall();
    loadingController();
  }

  bool isSwitched = false;
  bool isLoading = false;
  final controller = ScrollController();
  final ListNewsArguments listNewsArguments = ListNewsArguments();

  void loadingController() {
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent) {
        homeApiCall();
      }
    });
  }

  List<ArticleModel> articles = [];
  Future<void> homeApiCall() async {
    final _requestResult = await _fetchNewsDetailUsecase(listNewsArguments);

    return _requestResult.fold((failure) => failure, (data) {
      if (listNewsArguments.page == 1) {
        articles = data.articles;
      } else {
        articles.addAll(data.articles);
      }

      notifyListeners();

      listNewsArguments.page++;
    });
  }

  Future<void> fetchNewsByCategory(int index) async {
    listNewsArguments.category = kEntities[index].categoryName.toLowerCase();

    listNewsArguments.page = 1;

    await homeApiCall();
    Go.to.page(
      PageRoutes.categoryDetailsPage,
    );
  }

  Future<void> refreshHomePage() async {
    listNewsArguments.page = 1;
    articles.clear();

    notifyListeners();

    Future.delayed(const Duration(seconds: 1), () {
      homeApiCall();
    });
  }
}
