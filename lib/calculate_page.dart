import 'package:card_game_calculator/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

import 'my_widget.dart';

class CalculatePage extends ReactiveStateWidget<DataController> {
  CalculatePage({super.key});

  @override
  BindController<DataController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => DataController());
  }

  final FocusNode p1FocusNode = FocusNode();
  final FocusNode p2FocusNode = FocusNode();
  final FocusNode p3FocusNode = FocusNode();
  final FocusNode p4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Observer(
                listenable: controller.callTotal,
                listener: (totalCall) {
                  return Flexible(
                    child: Text(
                      'Total Call : (${controller.callTotal.value.toString()}/13)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: controller.callTotal.value < 9 ||
                                  controller.callTotal.value > 13
                              ? Colors.red
                              : Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                }),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerNameWidget(controller: controller, playerIndex: 0),
                PlayerNameWidget(controller: controller, playerIndex: 1),
                PlayerNameWidget(controller: controller, playerIndex: 2),
                PlayerNameWidget(controller: controller, playerIndex: 3),
              ],
            ),
            const Divider(color: Colors.grey, thickness: 3),
            TotalScoreWidget(controller: controller),
            const Divider(color: Colors.grey, thickness: 3),
            const SizedBox(height: 10),
            Observer(
                listenable: controller.isObscureText,
                listener: (obscure) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          focusNode: p1FocusNode,
                          maxLength: 1,
                          onSubmitted: (focus) {
                            FocusScope.of(context).requestFocus(p2FocusNode);
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          obscureText: controller.isObscureText.value,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              controller.player1Call.value = int.parse(val);
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          focusNode: p2FocusNode,
                          maxLength: 1,
                          onSubmitted: (focus) {
                            FocusScope.of(context).requestFocus(p3FocusNode);
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          obscureText: controller.isObscureText.value,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              controller.player2Call.value = int.parse(val);
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          focusNode: p3FocusNode,
                          maxLength: 1,
                          onSubmitted: (focus) {
                            FocusScope.of(context).requestFocus(p4FocusNode);
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          obscureText: controller.isObscureText.value,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              controller.player3Call.value = int.parse(val);
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          focusNode: p4FocusNode,
                          maxLength: 1,
                          onSubmitted: (focus) {
                            FocusScope.of(context).unfocus();
                          },
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          obscureText: controller.isObscureText.value,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              controller.player4Call.value = int.parse(val);
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 3))),
                        ),
                      ),
                    ],
                  );
                }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  color: Colors.black,
                  onPressed: () {
                    if (controller.player1Call.value > 0 &&
                        controller.player2Call.value > 0 &&
                        controller.player3Call.value > 0 &&
                        controller.player4Call.value > 0) {
                      controller.callConfirm();
                      controller.visibilityCheck.value = true;
                    }
                  },
                  child: const Text(
                    'Confirm',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 10),
                Observer(
                    listenable: controller.visibilityCheck,
                    listener: (visible) {
                      return Visibility(
                        visible: visible,
                        child: Expanded(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            color: Colors.black,
                            onPressed: () {
                              if (controller.player1Call.value > 0 &&
                                  controller.player2Call.value > 0 &&
                                  controller.player3Call.value > 0 &&
                                  controller.player4Call.value > 0) {
                                controller.nextButton();
                                controller.scoreboardRound.value++;
                                controller.visibilityCheck.value = false;
                              }
                            },
                            child: const Text(
                              'Settle All',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
            const SizedBox(height: 10),
            Opacity(
              opacity: 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlayerNameWidget(
                      controller: controller,
                      playerIndex: 0,
                      textColor: Colors.green),
                  PlayerNameWidget(
                      controller: controller,
                      playerIndex: 1,
                      textColor: Colors.pink),
                  PlayerNameWidget(
                      controller: controller,
                      playerIndex: 2,
                      textColor: Colors.green),
                  PlayerNameWidget(
                      controller: controller,
                      playerIndex: 3,
                      textColor: Colors.pink),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Observer4(
                listenable: controller.player1CallList,
                listenable2: controller.player2CallList,
                listenable3: controller.player3CallList,
                listenable4: controller.player4CallList,
                listener: (p1, p2, p3, p4) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: controller.player1CallList.length,
                        itemBuilder: (context, index) {
                          return Opacity(
                            opacity: 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.player1CallList[index].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.green),
                                ),
                                Text(
                                  controller.player2CallList[index].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.pink.withOpacity(0.8)),
                                ),
                                Text(
                                  controller.player3CallList[index].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.green.withOpacity(0.8)),
                                ),
                                Text(
                                  controller.player4CallList[index].toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.pink.withOpacity(0.8)),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
