import 'package:flutter_vault_app/controllers/calculator_controller.dart';
import 'package:flutter_vault_app/controllers/theme_controller.dart';
import 'package:get/get.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> CalculatorController());
    Get.lazyPut(()=> ThemeController());
  }

}