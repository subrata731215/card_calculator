import 'package:card_game_calculator/controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class CallInputWidget extends ReactiveStateWidget<CallBridgeController> {
  @override
  BindController<CallBridgeController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CallBridgeController());
  }

  CallInputWidget({super.key});

  final FocusNode p1FocusNode = FocusNode();
  final FocusNode p2FocusNode = FocusNode();
  final FocusNode p3FocusNode = FocusNode();
  final FocusNode p4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Observer(
        listenable: controller.obscure,
        listener: (obscure) {
          return Row(
            children: [
              Expanded(
                child: TextField(
                    obscureText: controller.obscure.value,
                    controller: controller.player1CallController,
                    focusNode: p1FocusNode,
                    maxLength: 2,
                    onSubmitted: (focus) {
                      FocusScope.of(context).requestFocus(p2FocusNode);
                    },
                    textAlign: TextAlign.center,
                    style: textFieldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                    obscureText: controller.obscure.value,
                    controller: controller.player2CallController,
                    focusNode: p2FocusNode,
                    maxLength: 2,
                    onSubmitted: (focus) {
                      FocusScope.of(context).requestFocus(p3FocusNode);
                    },
                    textAlign: TextAlign.center,
                    style: textFieldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                    obscureText: controller.obscure.value,
                    controller: controller.player3CallController,
                    focusNode: p3FocusNode,
                    maxLength: 2,
                    onSubmitted: (focus) {
                      FocusScope.of(context).requestFocus(p4FocusNode);
                    },
                    textAlign: TextAlign.center,
                    style: textFieldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                    obscureText: controller.obscure.value,
                    controller: controller.player4CallController,
                    focusNode: p4FocusNode,
                    maxLength: 2,
                    onSubmitted: (focus) {
                      FocusScope.of(context).unfocus();
                    },
                    textAlign: TextAlign.center,
                    style: textFieldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: inputDecoration),
              ),
            ],
          );
        });
  }
}

InputDecoration inputDecoration = const InputDecoration(
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, width: 1)));
TextStyle textFieldTextStyle =
    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
