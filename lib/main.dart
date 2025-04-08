import 'package:flutter/material.dart';
import 'package:ridehailing_passenger/models/auth/login_models.dart';
import 'package:ridehailing_passenger/views/auth/login_view.dart';
import 'package:provider/provider.dart';
import 'package:ridehailing_passenger/views/main/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, _) {
      return MaterialApp(
        title: 'Passenger RideHailing',
        theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder<bool>(
          future: loginViewModel.checkLoginStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.data == true) {
              return const MainView();
            } else {
              return const LoginView();
            }
          },
        ),
      );
    });
  }
}
