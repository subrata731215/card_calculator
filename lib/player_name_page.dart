import 'package:card_game_calculator/calculate_page.dart';
import 'package:card_game_calculator/controller.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/background.jpeg'),
                  fit: BoxFit.cover),
              border: Border.all(color: Colors.black, width: 3)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Column(
                  children: [
                    TextField(
                        onChanged: (value) {
                          controller.player1Name.value = value;
                        },
                        style: typeTextStyle,
                        focusNode: player1FocusNode,
                        onSubmitted: (focus) {
                          FocusScope.of(context).requestFocus(player2FocusNode);
                        },
                        decoration: inputDecoration),
                    TextField(
                        onChanged: (value) {
                          controller.player2Name.value = value;
                        },
                        style: typeTextStyle,
                        focusNode: player2FocusNode,
                        onSubmitted: (focus) {
                          FocusScope.of(context).requestFocus(player3FocusNode);
                        },
                        decoration: inputDecoration.copyWith(
                            hintText: 'Player 2 Name')),
                    TextField(
                        onChanged: (value) {
                          controller.player3Name.value = value;
                        },
                        style: typeTextStyle,
                        focusNode: player3FocusNode,
                        onSubmitted: (focus) {
                          FocusScope.of(context).requestFocus(player4FocusNode);
                        },
                        decoration: inputDecoration.copyWith(
                            hintText: 'Player 3 Name')),
                    TextField(
                        onChanged: (value) {
                          controller.player4Name.value = value;
                        },
                        style: typeTextStyle,
                        focusNode: player4FocusNode,
                        onSubmitted: (focus) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: inputDecoration.copyWith(
                            hintText: 'Player 4 Name')),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (controller.player1Name.value.isNotEmpty &&
                              controller.player2Name.value.isNotEmpty &&
                              controller.player3Name.value.isNotEmpty &&
                              controller.player4Name.value.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CalculatePage()));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    padding: EdgeInsets.all(10),
                                    behavior: SnackBarBehavior.floating,
                                    // width: 320,
                                    showCloseIcon: true,
                                    closeIconColor: Colors.red,
                                    backgroundColor: Colors.black,
                                    elevation: 30,
                                    content: Text(
                                      'Input All The Player Name Field',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20),
                                    )));
                          }
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
        ),
      ),
    );
  }
}

InputDecoration inputDecoration = const InputDecoration(
  hintText: 'Player 1 Name',
  hintStyle: TextStyle(color: Colors.black),
  prefixIcon: Icon(Icons.star, size: 15, color: Colors.red),
  icon: Icon(Icons.person_sharp),
);

TextStyle typeTextStyle = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w900, color: Colors.deepPurple);
