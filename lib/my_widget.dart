import 'package:card_game_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class TotalScoreWidget extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  const TotalScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer4(
        listenable: controller.player1CallList,
        listenable2: controller.player2CallList,
        listenable3: controller.player3CallList,
        listenable4: controller.player4CallList,
        listener: (p1, p2, p3, p4) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.p1TotalScore().toString(),
                  style: totalScoreTextStyle),
              Text(controller.p2TotalScore().toString(),
                  style: totalScoreTextStyle),
              Text(controller.p3TotalScore().toString(),
                  style: totalScoreTextStyle),
              Text(controller.p4TotalScore().toString(),
                  style: totalScoreTextStyle),
            ],
          );
        });
  }
}

TextStyle totalScoreTextStyle = const TextStyle(
    color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 50);

class PlayerNameWidget extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  const PlayerNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(controller.player1.value.toUpperCase(),
                textAlign: TextAlign.center, style: nameTextStyle),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(controller.player2.value.toUpperCase(),
                textAlign: TextAlign.center, style: nameTextStyle),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(controller.player3.value.toUpperCase(),
                textAlign: TextAlign.center, style: nameTextStyle),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(controller.player4.value.toUpperCase(),
                textAlign: TextAlign.center, style: nameTextStyle),
          ),
        ],
      ),
    );
  }
}

TextStyle nameTextStyle = const TextStyle(
    color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 18);
