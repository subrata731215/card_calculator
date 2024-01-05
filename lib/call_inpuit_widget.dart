import 'package:card_game_calculator/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/state_management/widgets/observer.dart';
import 'package:reactiv/views/reactive_state_widget.dart';

class CallInputWidget extends ReactiveStateWidget<DataController> {
  @override
  BindController<DataController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: ()=>DataController());
  }
   CallInputWidget({super.key});

  final FocusNode p1FocusNode = FocusNode();
  final FocusNode p2FocusNode = FocusNode();
  final FocusNode p3FocusNode = FocusNode();
  final FocusNode p4FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Observer(
        listenable: controller.isObscureText,
        listener: (obscure) {
          return Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: controller.isInputReadonly.value,
                  controller: controller.player1CallController,
                  focusNode: p1FocusNode,
                  maxLength: 2,
                  onSubmitted: (focus) {
                    FocusScope.of(context).requestFocus(p2FocusNode);
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue, width: 3))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  readOnly: controller.isInputReadonly.value,
                  controller: controller.player2CallController,
                  focusNode: p2FocusNode,
                  maxLength: 2,
                  onSubmitted: (focus) {
                    FocusScope.of(context).requestFocus(p3FocusNode);
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue, width: 3))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  readOnly: controller.isInputReadonly.value,
                  controller: controller.player3CallController,
                  focusNode: p3FocusNode,
                  maxLength: 2,
                  onSubmitted: (focus) {
                    FocusScope.of(context).requestFocus(p4FocusNode);
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue, width: 3))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  readOnly: controller.isInputReadonly.value,
                  controller: controller.player4CallController,
                  focusNode: p4FocusNode,
                  maxLength: 2,
                  onSubmitted: (focus) {
                    FocusScope.of(context).unfocus();
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.blue, width: 3))),
                ),
              ),
            ],
          );
        });
  }
}
