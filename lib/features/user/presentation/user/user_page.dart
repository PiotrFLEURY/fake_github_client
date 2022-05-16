import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_client/features/user/data/user.dart';
import 'package:github_client/features/user/presentation/user/bloc/user_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(),
      child: BlocBuilder<UserBloc, User?>(builder: (context, user) {
        if (user == null) {
          final token = ModalRoute.of(context)?.settings.arguments as String;
          context.read<UserBloc>().fetchUser(token);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => _back(context),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return _UserPageContent(user: user);
      }),
    );
  }

  _back(BuildContext context) {
    Navigator.of(context).pop();
  }
}

class _UserPageContent extends StatelessWidget {
  final User user;

  const _UserPageContent({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(64.0),
                child: Icon(Icons.person, size: 128.0),
              ),
              Text(
                'Name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(user.login ?? 'NO_LOGIN'),
              Text(
                'Repositories',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton(
                onPressed: () => _launch(user.reposURL),
                child: Text(user.reposURL ?? 'NO_REPOS'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launch(String? url) {
    if (url == null) {
      return;
    }
    launchUrl(Uri.dataFromString(url));
  }
}
