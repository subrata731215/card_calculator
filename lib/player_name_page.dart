import 'package:card_game_calculator/calculate_page.dart';
import 'package:card_game_calculator/controller.dart';
import 'package:card_game_calculator/my_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class PlayerNamePage extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  PlayerNamePage({super.key});

  final FocusNode player1FocusNode = FocusNode();
  final FocusNode player2FocusNode = FocusNode();
  final FocusNode player3FocusNode = FocusNode();
  final FocusNode player4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Players'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  onChanged: (value) {
                    controller.player1.value = value;
                  },
                  focusNode: player1FocusNode,
                  onSubmitted: (focus) {
                    FocusScope.of(context).requestFocus(player2FocusNode);
                  },
                  decoration: const InputDecoration(labelText: 'Player 1'),
                ),
                TextField(
                  onChanged: (value) {
                    controller.player2.value = value;
                  },
                  focusNode: player2FocusNode,
                  onSubmitted: (focus) {
                    FocusScope.of(context).requestFocus(player3FocusNode);
                  },
                  decoration: const InputDecoration(labelText: 'Player 2'),
                ),
                TextField(
                  onChanged: (value) {
                    controller.player3.value = value;
                  },
                  focusNode: player3FocusNode,
                  onSubmitted: (focus) {
                    FocusScope.of(context).requestFocus(player4FocusNode);
                  },
                  decoration: const InputDecoration(labelText: 'Player 3'),
                ),
                TextField(
                  onChanged: (value) {
                    controller.player4.value = value;
                  },
                  focusNode: player4FocusNode,
                  onSubmitted: (focus) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: const InputDecoration(labelText: 'Player 4'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CalculatePage()));
                    },
                    child: const Text('Next')),
              ],
            ),
            const Text(
                '*Player 1, Player 2, Player 3, Player 4 are filled mandatory*',
                style: TextStyle(color: Colors.red, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
