import 'package:card_game_calculator/call_inpuit_widget.dart';
import 'package:card_game_calculator/call_withraw_widget.dart';
import 'package:card_game_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'my_widget.dart';

class CalculatePage extends ReactiveStateWidget<CallBridgeController> {
  const CalculatePage({super.key});

  @override
  BindController<CallBridgeController>? bindController() {
    return BindController(controller: () => CallBridgeController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              'Round',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 10),
            Observer(
                listenable: controller.scoreboardRound,
                listener: (round) {
                  return Text(
                    controller.scoreboardRound.value.toString(),
                    style: const TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                }),
            const SizedBox(width: 10),
            Flexible(
              child: Observer(
                  listenable: controller.totalCall,
                  listener: (context) {
                    return Text(
                      'Total Call : ${controller.totalCall.value}/13',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    );
                  }),
            ),
          ],
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, right: 18, top: 5, bottom: 5),
        child: Column(
          children: [
            const SizedBox(height: 20),
             const PlayerNameWidget(),
            divider,
            const TotalScoreWidget(),
            divider,
            sizedBox10,
            CallInputWidget(),
            sizedBox10,
            CallWithrawWidget(),
            sizedBox10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.confirmButton();
                    },
                    child: const Text('1. Confirm')),
                const SizedBox(width: 40),
                ElevatedButton(
                    onPressed: () {
                      controller.nextButton();
                    },
                    child: const Text('2. Next')),
              ],
            ),
            const SizedBox(height: 10),
            divider,
             PlayerNameWidget(),
            const SizedBox(height: 10),
            Expanded(
              child: Observer4(
                  listenable: controller.player2CallList,
                  listenable2: controller.player2CallList,
                  listenable3: controller.player3CallList,
                  listenable4: controller.player4CallList,
                  listener: (p1, p2, p3, p4) {
                    return ListView.builder(
                        itemCount: controller.player4CallList.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PlayerWiseCallCountWidget(
                                controller: controller,
                                text: controller.player1CallList[index],
                              ),
                              PlayerWiseCallCountWidget(
                                  controller: controller,
                                  text: controller.player2CallList[index]),
                              PlayerWiseCallCountWidget(
                                  controller: controller,
                                  text: controller.player3CallList[index]),
                              PlayerWiseCallCountWidget(
                                  controller: controller,
                                  text: controller.player4CallList[index]),
                            ],
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class PlayerWiseCallCountWidget extends StatelessWidget {
  const PlayerWiseCallCountWidget(
      {super.key, required this.controller, required this.text});

  final CallBridgeController controller;
  final int text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.green),
    );
  }
}

Divider divider = const Divider(
  color: Colors.grey,
  thickness: 2,
);
SizedBox sizedBox10 = const SizedBox(height: 10);
