import 'package:flutter/material.dart';

Future nameChangeDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: TextField(
              style: const TextStyle(fontWeight: FontWeight.bold),
              onChanged: (name) {
                if (name.isNotEmpty) {
                  // playerNameInputScreenController.player1Name.value = name;
                }
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Change Player1 Name'),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok')),
            ],
          ));
}
