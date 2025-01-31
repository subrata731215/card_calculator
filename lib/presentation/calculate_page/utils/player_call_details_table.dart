import 'package:flutter/material.dart';

class PlayerCallDetailsTable extends StatelessWidget {
  const PlayerCallDetailsTable({super.key, required this.playerCurrentCall});

  final int playerCurrentCall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 6, bottom: 6),
      child: Opacity(
        opacity: 0.7,
        child: Text(
          playerCurrentCall.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green),
        ),
      ),
    );
  }
}
