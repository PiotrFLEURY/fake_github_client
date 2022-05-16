import 'package:github_client/features/user/data/sources/backend_api.dart';
import 'package:github_client/features/user/data/user.dart';
import 'package:github_client/singletons.dart';

class UserRepository {
  final api = getIt<BackendApi>();

  Future<User> fetchUserFromGithub(String token) {
    return api.fetchUserFromGithub(token);
  }
}
