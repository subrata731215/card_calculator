import 'package:flutter/material.dart';

class PlayerTotalScoreBox extends StatelessWidget {
  const PlayerTotalScoreBox({super.key, required this.playerTotalScore});

  final int playerTotalScore;

  @override
  Widget build(BuildContext context) {
    return Text(playerTotalScore.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 50));
  }
}
