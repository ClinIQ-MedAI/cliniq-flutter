import 'package:cliniq/core/api/api_config.dart';
import 'package:cliniq/core/api/dummy_api_consumer.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:cliniq/core/api/api_consumer.dart';
import 'package:cliniq/core/api/dio_consumer.dart';
import 'package:cliniq/features/auth/data/repos_impl/auth_repo_impl.dart';
import 'package:cliniq/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Connectivity
  getIt.registerSingleton<Connectivity>(Connectivity());

  // Decide API source
  if (ApiConfig.useDummyApi) {
    getIt.registerSingleton<ApiConsumer>(DummyApiConsumer());
  } else {
    final dio = Dio();
    final dioConsumer = DioConsumer(dio: dio);
    await dioConsumer.init();

    getIt.registerSingleton<Dio>(dio);
    getIt.registerSingleton<ApiConsumer>(dioConsumer);
  }

  // Repos
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(api: getIt<ApiConsumer>()));
}
