import 'package:flutter/material.dart';
import 'package:flutter_vault_app/controllers/calculator_controller.dart';
import 'package:flutter_vault_app/utils/colors.dart';
import 'package:flutter_vault_app/widgets/custom_appBar.dart';
import 'package:flutter_vault_app/widgets/methods/calculator_mathod.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GetBuilder<CalculatorController>(
        builder: (controller){
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Please enter your passcode",
                    style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(controller.userInput.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(controller.result.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.buttons.length,
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context , index){
                        final button = controller.buttons[index];
                        return button.isEmpty ? const SizedBox() : calculatorButton(button);
                      }
                  )

                ],
              ),
            ),
          );
        },
      )
    );
  }


}
