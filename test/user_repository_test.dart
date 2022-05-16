import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:github_client/features/user/data/sources/backend_api.dart';
import 'package:github_client/features/user/data/user.dart';
import 'package:github_client/features/user/domain/user_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repository_test.mocks.dart';

@GenerateMocks([
  BackendApi,
])
void main() {
  final getIt = GetIt.I;

  final backendApi = MockBackendApi();
  getIt.registerSingleton<BackendApi>(backendApi);

  test('test repository', () async {
    // GIVEN - ARRANGE
    final repository = UserRepository();
    const token = "tolkien";
    final fakeUser = User(
      login: "tolkien",
      reposURL: "https://api.github.com/users/tolkien/repos",
    );

    when(backendApi.fetchUserFromGithub(token)).thenAnswer(
      (realInvocation) => Future.value(fakeUser),
    );

    // WHEN - ACT
    final result = await repository.fetchUserFromGithub(token);

    // THEN - ASSERT
    expect(result, isA<User>());
    expect(result.login, fakeUser.login);
    expect(result.reposURL, fakeUser.reposURL);
  });
}
