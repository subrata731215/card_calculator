import 'package:card_game_calculator/presentation/calculate_page/controller/calculate_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class PlayerNameBox extends StatelessWidget {
  const PlayerNameBox({super.key, required this.playerName, required this.onChanged});

  final String playerName;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (x) {
                return AlertDialog(
                  title: TextFormField(
                    initialValue: playerName,
                    onChanged: onChanged,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              });
        },
        child: Text(playerName.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              letterSpacing: 0.5,
            )),
      ),
    );
  }
}

class PlayerNameRow extends StatelessWidget {
  const PlayerNameRow({
    super.key,
    required this.player1Name,
    required this.player2Name,
    required this.player3Name,
    required this.player4Name,
    required this.player1OnChanged,
    required this.player2OnChanged,
    required this.player3OnChanged,
    required this.player4OnChanged,
  });

  final String player1Name;
  final String player2Name;
  final String player3Name;
  final String player4Name;
  final void Function(String) player1OnChanged;
  final void Function(String) player2OnChanged;
  final void Function(String) player3OnChanged;
  final void Function(String) player4OnChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PlayerNameBox(playerName: player1Name, onChanged: player1OnChanged),
        PlayerNameBox(playerName: player2Name, onChanged: player2OnChanged),
        PlayerNameBox(playerName: player3Name, onChanged: player3OnChanged),
        PlayerNameBox(playerName: player4Name, onChanged: player4OnChanged),
      ],
    );
  }
}


