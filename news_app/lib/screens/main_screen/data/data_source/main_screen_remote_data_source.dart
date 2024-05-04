// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/helpers/error_handler.dart';
import 'package:news_app/screens/main_screen/data/models/news_model.dart';

abstract class MainScreenRemoteDataSourceInterface {
  Future<NewsModel?> getNews({
    int? pageNumber,
    int? pageSize,
    String? category,
  });
}

class MainScreenRemoteDataSource extends MainScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  MainScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<NewsModel?> getNews({
    int? pageNumber,
    int? pageSize,
    String? category,
  }) async {
    var res;
    try {
      res = await _networkService.getData(
        //top-headlines?country=us&category=&page=1&pageSize=10&apiKey=604c50d202d44b138f4645328ca3c52c
        url: 'top-headlines?apiKey=604c50d202d44b138f4645328ca3c52c',
        token: true,
        query: {
          "Page": pageNumber,
          "PageSize": pageSize,
          "country": 'sa',
          "category": category,
        },
      );
      return NewsModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(res['message']);
    }
  }
}
