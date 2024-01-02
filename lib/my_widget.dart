import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/state_management/widgets/observer.dart';

import 'controller.dart';

class TotalScoreWidget extends StatelessWidget {
  const TotalScoreWidget({
    super.key,
    required this.controller,
  });

  final DataController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Center(
            child: Observer(
                listenable: controller.player1CallList,
                listener: (total) {
                  return Text(
                    controller.player1Point().toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                }),
          ),
        ),
        Flexible(
          child: Center(
            child: Observer(
                listenable: controller.player2CallList,
                listener: (total) {
                  return Text(
                    controller.player2Point().toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                }),
          ),
        ),
        Flexible(
          child: Center(
            child: Observer(
                listenable: controller.player3CallList,
                listener: (total) {
                  return Text(
                    controller.player3Point().toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                }),
          ),
        ),
        Flexible(
          child: Center(
            child: Observer(
                listenable: controller.player4CallList,
                listener: (total) {
                  return Text(
                    controller.player4Point().toString(),
                    style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class PlayerNameWidget extends StatelessWidget {
  const PlayerNameWidget({
    super.key,
    required this.controller,
  });

  final DataController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            controller.allPlayerList[0].playerName,textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Flexible(
          child: Text(
            controller.allPlayerList[1].playerName,textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Flexible(
          child: Text(
            controller.allPlayerList[2].playerName,textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        Flexible(
          child: Text(
            controller.allPlayerList[3].playerName,textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}