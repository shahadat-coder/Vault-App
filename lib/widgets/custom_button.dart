import 'package:flutter/material.dart';
import 'package:flutter_vault_app/utils/colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.title, required this.onTap, this.backgroundColor, this.titleColor}) : super(key: key);

  final String title;
  final void Function() onTap;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.secondaryColors,
          borderRadius: BorderRadius.circular(40),
        ),
        child:  Center(
          child: Text(
            widget.title,
            style:  TextStyle(
              color:widget.titleColor ?? AppColors.thirdColors,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

        ),
      ),
    );
  }
}
