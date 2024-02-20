import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/calculator_controller.dart';
import '../../utils/colors.dart';

Widget calculatorButton(String button) {
  final controller = Get.put(CalculatorController());


  return InkWell(
    onTap: (){
     controller.handleButton(button);
    },
    child: Container(
      decoration: BoxDecoration(
          color: controller.getButtonBgColor(button),
          borderRadius: BorderRadius.circular(20),
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
  );
}