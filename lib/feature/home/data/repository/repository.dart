import 'dart:convert';
import 'package:news/core/utils/remote_data_source/_remote_data_source_exports.dart';
import 'package:news/feature/home/data/model/list_news_model.dart';
import 'package:news/core/error/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:news/feature/home/domain/repositories/i_home_repository.dart';
import '../../domain/entities/arguments/list_news_arguments.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final MainBaseGetUsecase? mainBaseGetUsecase;

  HomeRepositoryImpl({this.mainBaseGetUsecase});
  @override
  Future<Either<Failure, ListNewsModel>> fetchNewsTopHeadlines(
      ListNewsArguments arguments) async {
    try {
      final fetchHomeEither = await mainBaseGetUsecase!(GetRequestParams(
          queryparameters: arguments.toMap(),
          endPoint: MainEndpoints.topHeadlines

          //TODO: main endpointslere göre 2 tane daha fonk yaz.
          ));
      return fetchHomeEither.fold((failure) => Left(failure), (data) {
        ListNewsModel _listNewsmodel = ListNewsModel.fromJson(jsonDecode(data));

        return Right(_listNewsmodel);
      });
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
