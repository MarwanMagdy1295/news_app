import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/helpers/error_handler.dart';
import 'package:news_app/screens/main_screen/data/models/news_model.dart';

abstract class MainScreenRemoteDataSourceInterface {
  Future<NewsModel?> getNews({
    int? pageNumber,
    int? pageSize,
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
  }) async {
    try {
      final res = await _networkService.getData(
        url: 'everything?q=news&apiKey=604c50d202d44b138f4645328ca3c52c',
        token: true,
        query: {
          "Page": pageNumber,
          "PageSize": pageSize,
        },
      );
      return NewsModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
