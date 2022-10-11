import 'package:get_it/get_it.dart';
import 'package:news/core/utils/dio_manager.dart';
import 'package:news/core/utils/remote_data_source/domain/repositories/i_base_request_repository.dart';
import 'package:news/core/utils/remote_data_source/domain/usecases/main_base_get_use_case.dart';
import 'package:news/feature/bottom_navigation_bar/view_model/bottom_navigation_bar_provider.dart';
import 'package:news/feature/home/data/repository/repository.dart';
import 'package:news/feature/home/domain/repositories/i_home_repository.dart';
import 'package:news/feature/home/domain/usecases/fetch_news_detail_usecase.dart';

import 'package:news/feature/home/view_model/home_provider.dart';
import 'package:news/feature/search/data/repositories/search_news_repository_implementation.dart';
import 'package:news/feature/search/view_model/search_provider.dart';
import '../../feature/search/domain/repositories/search_news_repository.dart';
import '../../feature/search/domain/usecases/get_news_list_with_keywords.dart';
import 'package:news/feature/home/view_model/theme.dart';
import '../utils/remote_data_source/data/repositories/base_request_repository_impl.dart';

final sl = GetIt.instance;

void init() {
  //repository
  sl.registerFactory<IBaseRequestRepository>(
      () => BaseRequestRepositoryImpl(dio: DioManager.getDio()));

  //usecase

  sl.registerLazySingleton(() => MainBaseGetUsecase(sl()));

  sl.registerLazySingleton<IHomeRepository>(
    () => HomeRepositoryImpl(mainBaseGetUsecase: sl()),
  );

  //usecase

  sl.registerLazySingleton(() => FetchNewsDetailUsecase(sl()));

  //provider
  sl.registerLazySingleton<HomeProvider>(() => HomeProvider(sl<
      FetchNewsDetailUsecase>())); //TODO: daha iyi bir kullanım şekli clean code
  sl.registerLazySingleton<BottomNavigationBarProvider>(
      () => BottomNavigationBarProvider());
  sl.registerLazySingleton<ThemeNotifier>(() => ThemeNotifier());

  // Search \\
  //provider
  sl.registerLazySingleton<SearchProvider>(
      () => SearchProvider(getNewsListWithKeywords: sl()));

  //usecase
  sl.registerLazySingleton<GetNewsListWithKeywords>(
      () => GetNewsListWithKeywords(sl()));

  //repo
  sl.registerLazySingleton<SearchNewsRepository>(
      () => SearchNewsRepositoryImplementation(mainBaseGetUsecase: sl()));
}
