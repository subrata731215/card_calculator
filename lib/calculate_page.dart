import 'package:card_game_calculator/call_input_widget.dart';
import 'package:card_game_calculator/call_withdraw_widget.dart';
import 'package:card_game_calculator/controller.dart';
import 'package:card_game_calculator/utils.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'my_widget.dart';

class CalculatePage extends ReactiveStateWidget<CallBridgeController> {
  const CalculatePage({super.key});

  @override
  BindController<CallBridgeController>? bindController() {
    return BindController(controller: () => CallBridgeController());
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        listenable: controller.isScreenOn,
        listener: (screen) {
          return SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: controller.isScreenOn.value
                  ? controller.deActiveScreenColor
                  : controller.activeScreenColor,
              appBar: AppBar(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Text('Round', style: appBarTextStyle(controller)),
                    const SizedBox(width: 10),
                    Observer(
                        listenable: controller.scoreboardRound,
                        listener: (round) {
                          return Text(
                              controller.scoreboardRound.value.toString(),
                              style: appBarTextStyle(controller)
                                  .copyWith(color: Colors.yellow,fontSize: 30));
                        }),
                    const SizedBox(width: 40),
                    Text('Total Call : ', style: appBarTextStyle(controller)),
                    const SizedBox(width: 10),
                    Observer(
                        listenable: controller.totalCall,
                        listener: (totalCall) {
                          return Text(controller.totalCall.value.toString(),
                              style: appBarTextStyle(controller)
                                  .copyWith(color: Colors.yellow,fontSize: 30));
                        }),
                  ],
                ),
                actions: [
                  Tooltip(
                    message: 'AutoScreen On/Off',
                    child: Observer(
                        listenable: controller.isScreenOn,
                        listener: (screenOn) {
                          return Switch(
                              activeTrackColor: Colors.white,
                              activeColor: Colors.yellow,
                              inactiveThumbColor: Colors.white,
                              thumbIcon: const MaterialStatePropertyAll(Icon(
                                Icons.light_mode,
                                color: Colors.black,
                              )),
                              value: controller.isScreenOn.value,
                              onChanged: (value) {
                                controller.isScreenOn.value = value;

                                if (controller.isScreenOn.value) {
                                  WakelockPlus.enable();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          duration: Duration(seconds: 1),
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.green,
                                          content: Center(
                                              child: Text(
                                            'Always Screen On Activated',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ))));
                                } else {
                                  WakelockPlus.disable();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 1),
                                          dismissDirection:
                                              DismissDirection.startToEnd,
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                          content: Center(
                                              child: Text(
                                            'Always Screen On Deactivated',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ))));
                                }
                              });
                        }),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18, top: 5, bottom: 5),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const PlayerNameWidget(),
                    calculateScreenDivider,
                    const TotalScoreWidget(),
                    calculateScreenDivider,
                    sizedBox10,
                    CallInputWidget(),
                    sizedBox10,
                    CallWithdrawWidget(),
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
                    calculateScreenDivider,
                    const PlayerNameWidget(),
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
                                  return Table(
                                    textDirection: TextDirection.ltr,
                                    border: TableBorder.all(
                                        color: controller.isScreenOn.value
                                            ? Colors.white38
                                            : Colors.black38,
                                        borderRadius: BorderRadius.circular(5),
                                        width: 1),
                                    children: [
                                      TableRow(
                                        children: [
                                          PlayerWiseCallCountWidget(
                                            controller: controller,
                                            text: controller
                                                .player1CallList[index],
                                          ),
                                          PlayerWiseCallCountWidget(
                                              controller: controller,
                                              text: controller
                                                  .player2CallList[index]),
                                          PlayerWiseCallCountWidget(
                                              controller: controller,
                                              text: controller
                                                  .player3CallList[index]),
                                          PlayerWiseCallCountWidget(
                                              controller: controller,
                                              text: controller
                                                  .player4CallList[index]),
                                        ],
                                      )
                                    ],
                                  );
                                });
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

