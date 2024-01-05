import 'package:card_game_calculator/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'package:reactiv/state_management/widgets/observer.dart';

class CallWithrawWidget extends ReactiveStateWidget<DataController> {
  @override
  BindController<DataController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => DataController());
  }

  CallWithrawWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer2(
        listenable: controller.isObscureText,
        listenable2: controller.isWithrawReadonly,
        listener: (obscure,readonly) {
          return Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.player1WithrawCallController,
                  maxLength: 2,
                  readOnly: controller.isWithrawReadonly.value,

                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  // obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.player2WithrawCallController,
                  maxLength: 2,
                  readOnly: controller.isWithrawReadonly.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  // obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.player3WithrawCallController,
                  maxLength: 2,
                  readOnly: controller.isWithrawReadonly.value,

                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  // obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3))),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: controller.player4WithrawCallController,
                  maxLength: 2,
                  readOnly: controller.isWithrawReadonly.value,

                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                  keyboardType: TextInputType.number,
                  // obscureText: controller.isObscureText.value,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 3))),
                ),
              ),
            ],
          );
        });
  }
}
