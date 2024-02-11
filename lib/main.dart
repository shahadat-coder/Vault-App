import 'package:flutter/material.dart';
import 'package:flutter_vault_app/utils/colors.dart';
import 'package:get/get.dart';
import 'screens/splash_page.dart';
import 'utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.thirdColors,
      ),
      home: const SplashScreen(),
    );
  }
}

