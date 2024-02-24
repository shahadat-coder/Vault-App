import 'package:flutter/material.dart';
import 'package:flutter_vault_app/controllers/theme_controller.dart';
import 'package:get/get.dart';

import '../../controllers/calculator_controller.dart';
import '../../utils/colors.dart';

Widget calculatorButton(String button) {
  final controller = Get.put(CalculatorController());
  final themeController = Get.put(ThemeController());

  return InkWell(
    onTap: (){
     controller.handleButton(button);
    },
    child: Obx(()=> Container(

        decoration: BoxDecoration(
            color: controller.getButtonBgColor(button),
            borderRadius: BorderRadius.circular(themeController.selectedTheme.value == 0 ? 20 : 400),
            border: Border(
              top: BorderSide(
                  color: AppColors.secondaryColors.withOpacity(.5),
                  width: 1.5
              ),

            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.4),
                  blurRadius: 5,
                  spreadRadius: .5
              )
            ]
        ),
        child: Center(
          child: Text(button,
            style: TextStyle(
                color: controller.getButtonTextColor(button),
                fontWeight: FontWeight.bold,
                fontSize: 30
            ),
          ),
        ),
      ),
    ),
  );
}