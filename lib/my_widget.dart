import 'package:card_game_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class TotalScoreWidget extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  const TotalScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer4(
        listenable: controller.player1CallList,
        listenable2: controller.player2CallList,
        listenable3: controller.player3CallList,
        listenable4: controller.player4CallList,
        listener: (p1, p2, p3, p4) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.p1TotalScore().toString(),
                  style: totalScoreTextStyle),
              Text(controller.p2TotalScore().toString(),
                  style: totalScoreTextStyle),
              Text(controller.p3TotalScore().toString(),
                  style: totalScoreTextStyle),
              Text(controller.p4TotalScore().toString(),
                  style: totalScoreTextStyle),
            ],
          );
        });
  }
}

TextStyle totalScoreTextStyle = const TextStyle(
    color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 50);

class PlayerNameWidget extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  const PlayerNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Observer(
                listenable: controller.player1Name,
                listener: (p1name) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: TextField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  onChanged: (name) {
                                    if (name.isNotEmpty) {
                                      controller.player1Name.value = name;
                                    }
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                    },
                    child: Text(controller.player1Name.value.toUpperCase(),
                        textAlign: TextAlign.center, style: nameTextStyle),
                  );
                }),
          ),
          //  const SizedBox(width: 5),
          Expanded(
            child: Observer(
                listenable: controller.player2Name,
                listener: (p2name) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: TextField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  onChanged: (name) {
                                    controller.player2Name.value = name;
                                  },
                                  decoration:  InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      hintText: 'Change player2 Name'),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok')),
                                ],
                              ));
                    },
                    child: Text(controller.player2Name.value.toUpperCase(),
                        textAlign: TextAlign.center, style: nameTextStyle),
                  );
                }),
          ),
          // const SizedBox(width: 5),
          Expanded(
            child: Observer(
                listenable: controller.player3Name,
                listener: (p3name) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: TextField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  onChanged: (name) {
                                    controller.player3Name.value = name;
                                  },
                                  decoration:  InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      hintText: 'Change Player3 Name'),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok')),
                                ],
                              ));
                    },
                    child: Text(controller.player3Name.value.toUpperCase(),
                        textAlign: TextAlign.center, style: nameTextStyle),
                  );
                }),
          ),
          //   const SizedBox(width: 5),
          Expanded(
            child: Observer(
                listenable: controller.player4Name,
                listener: (p4name) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: TextField(
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                  onChanged: (name) {
                                    controller.player4Name.value = name;
                                  },
                                  decoration:  InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      hintText: 'Change Player4 Name'),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Ok')),
                                ],
                              ));
                    },
                    child: Text(controller.player4Name.value.toUpperCase(),
                        textAlign: TextAlign.center, style: nameTextStyle),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

TextStyle nameTextStyle = const TextStyle(
    color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 15);
