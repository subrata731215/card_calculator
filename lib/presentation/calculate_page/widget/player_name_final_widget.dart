import 'package:card_game_calculator/presentation/calculate_page/utils/player_name_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactiv/state_management/widgets/observer.dart';
import 'package:reactiv/views/reactive_state_widget.dart';

import '../controller/calculate_screen_controller.dart';

class PlayerNameFinalWidget extends ReactiveStateWidget<CalculateScreenController> {
  @override
  BindController<CalculateScreenController>? bindController() {
    return BindController(controller: () => CalculateScreenController());
  }

  const PlayerNameFinalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer4(
        listenable: controller.playerList[0].playerName,
        listenable2: controller.playerList[1].playerName,
        listenable3: controller.playerList[2].playerName,
        listenable4: controller.playerList[3].playerName,
        listener: (p1, p2, p3, p4) {
          return PlayerNameRow(
            player1Name: controller.playerList[0].playerName.value,
            player2Name: controller.playerList[1].playerName.value,
            player3Name: controller.playerList[2].playerName.value,
            player4Name: controller.playerList[3].playerName.value,
            player1OnChanged: (value) {
              controller.playerList[0].playerName.value = value;
            },
            player2OnChanged: (value) {
              controller.playerList[1].playerName.value = value;
            },
            player3OnChanged: (value) {
              controller.playerList[2].playerName.value = value;
            },
            player4OnChanged: (value) {
              controller.playerList[3].playerName.value = value;
            },
          );
        });
  }
}