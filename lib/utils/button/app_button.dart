import 'package:card_game_calculator/graphics/graphics_colors_const.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.buttonText, this.onPressed});

  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: GraphicsColorConst.green),
      onPressed: onPressed,
      child: Text(buttonText,style: TextStyle(color: GraphicsColorConst.white),),
    );
  }
}
