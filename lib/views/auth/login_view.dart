import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login View',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}