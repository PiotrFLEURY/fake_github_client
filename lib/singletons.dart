import 'package:get_it/get_it.dart';
import 'package:github_client/features/user/data/sources/backend_api.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.I;

registerSingletons() {
  getIt.registerSingleton(BackendApi(Dio()));
}
