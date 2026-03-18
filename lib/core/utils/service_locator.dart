import 'package:get_it/get_it.dart';
import 'package:test2/core/network/api_service.dart';
import 'package:test2/core/network/dio_client.dart';
import 'package:test2/features/home/data/repos/home_repo/home_repo_implem.dart';

final getIt = GetIt.instance;
void configureDependencies() {
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<ApiService>(
    ApiService(dioClient: getIt<DioClient>()),
  );
  getIt.registerLazySingleton<HomeRepoImplem>(
    () => HomeRepoImplem(getIt<DioClient>(), apiService: getIt<ApiService>()),
  );
}
