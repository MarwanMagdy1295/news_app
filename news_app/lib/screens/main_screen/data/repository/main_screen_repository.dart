import 'package:news_app/screens/main_screen/data/data_source/main_screen_remote_data_source.dart';
import 'package:news_app/screens/main_screen/data/models/news_model.dart';

abstract class MainScreenRepositoryInterface {
  Future<NewsModel?> getNews({
    int? pageNumber,
    int? pageSize,
    String? category,
  });
}

class MainScreenRepository extends MainScreenRepositoryInterface {
  final MainScreenRemoteDataSource _mainScreenRepository;

  MainScreenRepository({
    required MainScreenRemoteDataSource mainScreenRepository,
  }) : _mainScreenRepository = mainScreenRepository;

  @override
  Future<NewsModel?> getNews({
    int? pageNumber,
    int? pageSize,
    String? category,
  }) async {
    try {
      final data = await _mainScreenRepository.getNews(
        pageNumber: pageNumber,
        pageSize: pageSize,
        category: category,
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
