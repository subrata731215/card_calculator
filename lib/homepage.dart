import 'package:card_game_calculator/player_name_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/call_bridge.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    border: Border.all(color: Colors.green, width: 5)),
                child: const Text(
                  'Call Bridge Calculator',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                  color: Colors.green,
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlayerNamePage()));
                  }),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5),
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Version name 0.0.1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
