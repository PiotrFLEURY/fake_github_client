import 'package:github_client/features/user/data/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'backend_api.g.dart';

@RestApi(baseUrl: "http://localhost:8080/")
abstract class BackendApi {
  factory BackendApi(Dio dio, {String baseUrl}) = _BackendApi;

  @GET('/users')
  Future<User> fetchUserFromGithub(@Header('token') String token);
}
