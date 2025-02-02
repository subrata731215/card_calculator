import 'package:card_game_calculator/presentation/calculate_page/controller/calculate_screen_controller.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/player_total_score_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactiv/reactiv.dart';

class PlayerTotalScoreWidget extends ReactiveStateWidget<CalculateScreenController> {
  @override
  BindController<CalculateScreenController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CalculateScreenController());
  }

  const PlayerTotalScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer2(
      listenable2: controller.state.isSecondStep,
        listenable: controller.playerList,
        listener: (secondStep,player) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PlayerTotalScoreBox(playerTotalScore: controller.playerList[0].totalScore),
              PlayerTotalScoreBox(playerTotalScore: controller.playerList[1].totalScore),
              PlayerTotalScoreBox(playerTotalScore: controller.playerList[2].totalScore),
              PlayerTotalScoreBox(playerTotalScore: controller.playerList[3].totalScore),
            ],
          );
        });
  }
}
