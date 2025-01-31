import 'package:card_game_calculator/graphics/graphics_assets_const.dart';
import 'package:card_game_calculator/graphics/graphics_colors_const.dart';
import 'package:card_game_calculator/graphics/graphics_string_const.dart';
import 'package:card_game_calculator/presentation/calculate_page/calculate_page_test.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(GraphicsAssetsConst.callBridge), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatePage()));
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: GraphicsColorConst.orange,
                      border: Border.all(color: GraphicsColorConst.green, width: 5)),
                  child: const Text(
                    GraphicsStringConst.appTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
                child: const Opacity(
                  opacity: 0.5,
                  child: Text(
                    GraphicsStringConst.versionName,
                    style: TextStyle(color: GraphicsColorConst.white),
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
