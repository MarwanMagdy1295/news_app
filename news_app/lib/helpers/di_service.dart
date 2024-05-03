import 'package:get_it/get_it.dart';
import 'package:news_app/helpers/dio_helper.dart';
import 'package:news_app/helpers/prefs_service.dart';
import 'package:news_app/screens/main_screen/data/data_source/main_screen_remote_data_source.dart';
import 'package:news_app/screens/main_screen/data/repository/main_screen_repository.dart';
import 'package:news_app/screens/main_screen/ux/cubit.dart';

final di = GetIt.instance;

class DiService {
  static init() async {
    // PrefsService
    di.registerLazySingleton(() => PrefsService());
    await di<PrefsService>().init();

    // NetworkService
    di.registerLazySingleton(
      () => NetworkService(
        prefsService: di(),
      ),
    );

    // Landing
    di.registerLazySingleton(
      () => MainScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => MainScreenRepository(
        mainScreenRepository: di(),
      ),
    );
    di.registerLazySingleton(
      () => MainScreenCubit(),
    );
  }
}
