import 'package:flutter/material.dart';
import 'package:github_client/features/user/presentation/token/token_page.dart';
import 'package:github_client/features/user/presentation/user/user_page.dart';
import 'package:github_client/singletons.dart';

void main() {
  registerSingletons();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XPEHO Github client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/token',
      routes: {
        '/token': (context) => const TokenPage(),
        '/user': (context) => const UserPage(),
      },
    );
  }
}
