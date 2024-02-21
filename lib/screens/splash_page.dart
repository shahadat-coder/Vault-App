import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_vault_app/controllers/app_controller.dart';
import 'package:flutter_vault_app/utils/colors.dart';
import 'package:flutter_vault_app/utils/config.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final appController = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      appController.checkAppState();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset('assets/images/logo.jpg')),
          const SizedBox(height: 20,),
          const Text(AppConfig.appName,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.secondaryColors
            ),
          )
        ],
      ),
    );
  }
}
