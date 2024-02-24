import 'package:flutter/material.dart';
import 'package:flutter_vault_app/bindings/all_bindings.dart';
import 'package:flutter_vault_app/controllers/theme_controller.dart';
import 'package:flutter_vault_app/core/services/shared_services.dart';
import 'package:flutter_vault_app/utils/colors.dart';
import 'package:flutter_vault_app/utils/keys.dart';
import 'package:get/get.dart';
import 'screens/splash_page.dart';
import 'utils/config.dart';

void main() {
  AllBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeController = Get.put(ThemeController());

  checkSelectedTheme () async {
    SharedServices().getData(SetType.int, SharedKeys.selectedTheme).then((value){
      themeController.selectedTheme.value = value;
    });
  }
 @override
  void initState() {
   super.initState();
   checkSelectedTheme ();
  }
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

