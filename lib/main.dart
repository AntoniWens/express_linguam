import 'package:express_lingua/injection_container.dart';
import 'package:express_lingua/presentation/auth/login/login_page.dart';
import 'package:express_lingua/presentation/auth/register/register_page.dart';
import 'package:express_lingua/screens/home_page.dart';
import 'package:express_lingua/screens/main_page.dart';
import 'package:express_lingua/screens/splash_page.dart';
import 'package:flutter/material.dart';

import 'core/utils/environment.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();

  await Environment.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
    );
  }
}
