import 'package:card_game_calculator/graphics/graphics_colors_const.dart';
import 'package:card_game_calculator/graphics/graphics_string_const.dart';
import 'package:card_game_calculator/presentation/calculate_page/controller/calculate_screen_controller.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/call_input_withdraw_textfields.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/given_withdraw_call_text.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/player_call_details_table.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/player_name_box.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/player_total_score_box.dart';
import 'package:card_game_calculator/presentation/calculate_page/utils/total_call_text.dart';
import 'package:card_game_calculator/presentation/calculate_page/widget/appbar_switch_widget.dart';
import 'package:card_game_calculator/presentation/calculate_page/widget/player_name_final_widget.dart';
import 'package:card_game_calculator/presentation/calculate_page/widget/player_total_score_widget.dart';
import 'package:card_game_calculator/utils/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class CalculatePage extends ReactiveStateWidget<CalculateScreenController> {
  const CalculatePage({super.key});

  @override
  BindController<CalculateScreenController>? bindController() {
    return BindController(controller: () => CalculateScreenController());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
          automaticallyImplyLeading: false,
          actions: const [
            AppbarSwitchWidget(),
          ],
          title: Observer(
              listenable: controller.state.totalCall,
              listener: (total) {
                return TotalCallText(totalText: total.toString());
              }),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 0, bottom: 5.0),
          child: Observer2(
              listenable: controller.state.isSecondStep,
              listenable2: controller.playerList,
              listener: (secondStep, playerList) {
                return Column(
                  children: [
                    const SizedBox(height: 5),
                    const PlayerNameFinalWidget(),
                    const Divider(color: Colors.grey, thickness: 2),
                    const PlayerTotalScoreWidget(),
                    const Divider(color: Colors.grey, thickness: 2),
                    Observer(
                        listenable: controller.state.obscure,
                        listener: (obscure) {
                          return Column(
                            children: [
                              const GivenWithdrawCallText(text: 'Given Call'),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player1CallTEC,
                                    obscureText: controller.state.obscure.value,
                                    focusNode: controller.state.p1FocusNode,
                                    nextFocusNode: controller.state.p2FocusNode,
                                  ),
                                  const SizedBox(width: 10),
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player2CallTEC,
                                    obscureText: controller.state.obscure.value,
                                    focusNode: controller.state.p2FocusNode,
                                    nextFocusNode: controller.state.p3FocusNode,
                                  ),
                                  const SizedBox(width: 10),
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player3CallTEC,
                                    obscureText: controller.state.obscure.value,
                                    focusNode: controller.state.p3FocusNode,
                                    nextFocusNode: controller.state.p4FocusNode,
                                  ),
                                  const SizedBox(width: 10),
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player4CallTEC,
                                    obscureText: controller.state.obscure.value,
                                    focusNode: controller.state.p4FocusNode,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                    const SizedBox(height: 10),
                    AppButton(
                      buttonText: GraphicsStringConst.confirm,
                      onPressed: () {
                        controller.confirmButton(1);
                      },
                    ),
                    controller.state.isSecondStep.value == false
                        ? const SizedBox.shrink()
                        : Column(
                            children: [
                              const GivenWithdrawCallText(text: 'Withdraw Call'),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player1WithdrawTEC,
                                    focusNode: controller.state.pp1FocusNode,
                                    nextFocusNode: controller.state.pp2FocusNode,
                                  ),
                                  const SizedBox(width: 10),
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player2WithdrawTEC,
                                    focusNode: controller.state.pp2FocusNode,
                                    nextFocusNode: controller.state.pp3FocusNode,
                                  ),
                                  const SizedBox(width: 10),
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player3WithdrawTEC,
                                    focusNode: controller.state.pp3FocusNode,
                                    nextFocusNode: controller.state.pp4FocusNode,
                                  ),
                                  const SizedBox(width: 10),
                                  CallInputWithdrawTextfields(
                                    controller: controller.state.player4WithdrawTEC,
                                    focusNode: controller.state.pp4FocusNode,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  AppButton(
                                    buttonText: GraphicsStringConst.save,
                                    onPressed: () {
                                      controller.saveButton();
                                    },
                                  ),
                                  AppButton(
                                    buttonText: GraphicsStringConst.settleAll,
                                    onPressed: () {
                                      controller.settleAllButton();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                    const SizedBox(height: 10),
                    if (controller.playerList[0].scoreList.isNotEmpty)
                      const Divider(color: Colors.grey, thickness: 2),
                    if (controller.playerList[0].scoreList.isNotEmpty) const PlayerNameFinalWidget(),
                    const SizedBox(height: 10),
                    if (controller.playerList[0].scoreList.isNotEmpty)
                      Expanded(
                        child: Observer(
                            listenable: controller.playerList,
                            listener: (playerScoreList) {
                              return ListView.builder(
                                  itemCount: controller.playerList[0].scoreList.length,
                                  itemBuilder: (context, index) {
                                    return Table(
                                      textDirection: TextDirection.ltr,
                                      border: TableBorder.all(
                                          color: GraphicsColorConst.green,
                                          borderRadius: BorderRadius.circular(5),
                                          width: 0.5),
                                      children: [
                                        TableRow(
                                          children: [
                                            PlayerCallDetailsTable(
                                                playerCurrentCall: playerScoreList[0].scoreList[index]),
                                            PlayerCallDetailsTable(
                                                playerCurrentCall: playerScoreList[1].scoreList[index]),
                                            PlayerCallDetailsTable(
                                                playerCurrentCall: playerScoreList[2].scoreList[index]),
                                            PlayerCallDetailsTable(
                                                playerCurrentCall: playerScoreList[3].scoreList[index]),
                                          ],
                                        )
                                      ],
                                    );
                                  });
                            }),
                      )
                  ],
                );
              }),
        ),
        drawer: Drawer(
          backgroundColor: Colors.red,
          child: ListView(
            children: const [
              DrawerHeader(
                child: Text('data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
