import 'package:flutter_vault_app/controllers/calculator_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=> CalculatorController());
  }

}