import 'package:flutter/material.dart';
import 'package:ridehailing_passenger/views/auth/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passenger RideHailing',
      home: LoginView(),
    );
  }
}
