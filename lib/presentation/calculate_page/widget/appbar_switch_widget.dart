import 'package:card_game_calculator/presentation/calculate_page/controller/calculate_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'package:reactiv/state_management/widgets/observer.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class AppbarSwitchWidget extends ReactiveStateWidget<CalculateScreenController> {
  @override
  BindController<CalculateScreenController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CalculateScreenController());
  }

  const AppbarSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'AutoScreen On/Off',
      child: Observer(
          listenable: controller.state.isScreenOn,
          listener: (screenOn) {
            return Switch(
                activeTrackColor: Colors.white,
                activeColor: Colors.yellow,
                inactiveThumbColor: Colors.white,
                value: controller.state.isScreenOn.value,
                onChanged: (value) {
                  controller.state.isScreenOn.value = value;
                  controller.state.brightness.value = Brightness.dark;
                  if (controller.state.isScreenOn.value) {
                    WakelockPlus.enable();
                  } else {
                    WakelockPlus.disable();
                    controller.state.brightness.value = Brightness.light;
                  }
                });
          }),
    );
  }
}
