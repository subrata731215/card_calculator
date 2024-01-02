import 'package:card_game_calculator/calculate_page.dart';
import 'package:card_game_calculator/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class PlayerNamePage extends ReactiveStateWidget<DataController> {
  @override
  BindController<DataController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => DataController());
  }

  const PlayerNamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Column(
              children: [
                TextField(
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      controller.allPlayerList[0].playerName = val;
                    }
                  },
                  decoration: const InputDecoration(labelText: 'Player 1'),
                ),
                TextField(
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      controller.allPlayerList[1].playerName = val;
                    }
                  },
                  decoration: InputDecoration(labelText: 'Player 2'),
                ),
                TextField(
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      controller.allPlayerList[2].playerName = val;
                    }
                  },
                  decoration: InputDecoration(labelText: 'Player 3'),
                ),
                TextField(
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      controller.allPlayerList[3].playerName = val;
                    }
                  },
                  decoration: InputDecoration(labelText: 'Player 4'),
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
                    child: Text('Next')),
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
