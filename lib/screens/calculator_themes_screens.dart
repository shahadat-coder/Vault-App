import 'package:flutter/material.dart';
import 'package:flutter_vault_app/controllers/theme_controller.dart';
import 'package:flutter_vault_app/core/services/shared_services.dart';
import 'package:flutter_vault_app/utils/keys.dart';
import 'package:flutter_vault_app/widgets/custom_appBar.dart';
import 'package:flutter_vault_app/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

class CalculatorThemesScreen extends StatefulWidget {
  const CalculatorThemesScreen({super.key});

  @override
  State<CalculatorThemesScreen> createState() => _CalculatorThemesScreenState();
}

class _CalculatorThemesScreenState extends State<CalculatorThemesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isLeading: true,
        title: 'Theme',
        actions: [],
      ),
      body: GetBuilder<ThemeController>(builder: (controller){
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  childAspectRatio: .46,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),

                  itemCount: controller.themes.length,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index){
                   return InkWell(
                     onTap: (){
                       controller.changeTheme(index);
                     },
                     child: Container(
                       padding: const EdgeInsets.all(5),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         border: Border.all(
                           color: controller.selectedTheme.value == index ? AppColors.primaryColors : Colors.black,
                         ),
                         borderRadius: BorderRadius.circular(20),
                         image: DecorationImage(image: AssetImage(controller.themes[index]),fit: BoxFit.fill)
                       ),
                       child: controller.selectedTheme.value == index ? const Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Icon(Icons.check_circle,color: AppColors.primaryColors,)
                         ],
                       ): const SizedBox()
                     ),
                   );
                  }),
              CustomButton(title: 'Confirm', onTap: (){
                SharedServices().setData(SetType.int, SharedKeys.selectedTheme, controller.selectedTheme.value);
                Get.back();
              })
            ],
          ),
        );
      },),

          );
  }
}
