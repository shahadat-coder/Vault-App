import 'package:flutter_vault_app/core/services/shared_services.dart';
import 'package:flutter_vault_app/screens/calculator_screen.dart';
import 'package:flutter_vault_app/screens/get_started.dart';
import 'package:flutter_vault_app/utils/keys.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AppController extends GetxController {
  final sharedServices = SharedServices();

  Future<bool> checkAppFirstTime()async{
    return await sharedServices.getData(SetType.bool,SharedKeys.alreadyOpened) ?? false;
  }

  checkAppState () async {
    final alreadyOpened = await checkAppFirstTime();

    if(alreadyOpened == true){
        Get.offAll(()=> const CalculatorScreen());
    }else{
      Get.offAll(()=> const GetStartedScreen());
    }
  }
}