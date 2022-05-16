import 'package:flutter/material.dart';

class TokenPage extends StatefulWidget {
  const TokenPage({Key? key}) : super(key: key);

  @override
  State<TokenPage> createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  String _token = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) => _token = value,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('GO !'),
          ),
        ],
      ),
    );
  }

  _submit() {
    Navigator.of(context).pushNamed('/user', arguments: _token);
  }
}
