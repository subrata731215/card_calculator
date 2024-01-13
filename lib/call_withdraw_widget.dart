import 'package:card_game_calculator/call_input_widget.dart';
import 'package:card_game_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class CallWithdrawWidget extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  CallWithdrawWidget({super.key});

  final FocusNode pp1FocusNode = FocusNode();
  final FocusNode pp2FocusNode = FocusNode();
  final FocusNode pp3FocusNode = FocusNode();
  final FocusNode pp4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller.player1WithdrawCallController,
            focusNode: pp1FocusNode,
            maxLength: 2,
            onSubmitted: (focus) {
              FocusScope.of(context).requestFocus(pp2FocusNode);
            },
            textAlign: TextAlign.center,
            style: textFieldTextStyle(controller),
            keyboardType: TextInputType.number,
            decoration: inputDecoration(controller),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller.player2WithdrawCallController,
            focusNode: pp2FocusNode,
            maxLength: 2,
            onSubmitted: (focus) {
              FocusScope.of(context).requestFocus(pp3FocusNode);
            },
            textAlign: TextAlign.center,
            style: textFieldTextStyle(controller),
            keyboardType: TextInputType.number,
            decoration: inputDecoration(controller),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller.player3WithdrawCallController,
            focusNode: pp3FocusNode,
            maxLength: 2,
            onSubmitted: (focus) {
              FocusScope.of(context).requestFocus(pp4FocusNode);
            },
            textAlign: TextAlign.center,
            style: textFieldTextStyle(controller),
            keyboardType: TextInputType.number,
            decoration: inputDecoration(controller),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller.player4WithdrawCallController,
            focusNode: pp4FocusNode,
            maxLength: 2,
            onSubmitted: (focus) {
              FocusScope.of(context).unfocus();
            },
            textAlign: TextAlign.center,
            style: textFieldTextStyle(controller),
            keyboardType: TextInputType.number,
            decoration: inputDecoration(controller),
          ),
        ),
      ],
    );
  }
}

InputDecoration inputDecoration(CallBridgeController controller) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: controller.isScreenOn.value ? Colors.white : Colors.blue,
          width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: controller.isScreenOn.value ? Colors.white : Colors.blue,
          width: 1),
    ),
  );
}
