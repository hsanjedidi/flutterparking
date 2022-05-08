import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/src/core/constants/app_theme.dart';
import '../auth/login.dart';
import 'core/constants/constants.dart';
import 'features/parkings/parking_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.light,
      home: const LoginScreen(),
    );
  }
}
