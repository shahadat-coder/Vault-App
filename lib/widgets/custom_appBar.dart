import 'package:flutter/material.dart';
import 'package:flutter_vault_app/screens/calculator_themes_screens.dart';
import 'package:flutter_vault_app/utils/colors.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isLeading;
  final List<Widget>? actions;
  const CustomAppBar({super.key,  this.title,  this.isLeading,this.actions});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
    backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: isLeading == true? IconButton(onPressed: (){
        Get.back();
      }, icon: const Icon(Icons.arrow_back,color: AppColors.secondaryColors,)) : null,
      elevation: 0,
      title: Text(title ?? '',
        style: const TextStyle(
          color: AppColors.secondaryColors,
        ),
      ),
      actions: actions ?? [
        IconButton(onPressed: ()=> Get.to(()=> const CalculatorThemesScreen()),
            icon: const Icon(Icons.settings,color: AppColors.secondaryColors,))
      ],
    );
  }
}
