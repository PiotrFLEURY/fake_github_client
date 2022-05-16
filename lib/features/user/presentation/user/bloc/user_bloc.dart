import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client/features/user/data/user.dart';
import 'package:github_client/features/user/domain/user_repository.dart';

class UserBloc extends Cubit<User?> {
  final repository = UserRepository();
  UserBloc() : super(null);

  Future<void> fetchUser(String token) {
    return fetchUserFromGithub(token).then((user) {
      emit(user);
    });
  }

  Future<User> fetchUserFromGithub(String token) {
    return repository.fetchUserFromGithub(token);
  }
}
