import 'package:card_game_calculator/graphics/graphics_colors_const.dart';
import 'package:flutter/cupertino.dart';

class TotalCallText extends StatelessWidget {
  const TotalCallText({super.key, required this.totalText});

  final String totalText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Total Call : ',
            style: TextStyle(color: GraphicsColorConst.black, fontWeight: FontWeight.w900, fontSize: 20)),
        const SizedBox(width: 10),
        Text(
          totalText.toString(),
          style: const TextStyle(color: GraphicsColorConst.yellow, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
