import 'package:flutter/material.dart';

import 'controller.dart';

Divider calculateScreenDivider = const Divider(
  color: Colors.grey,
  thickness: 2,
);
SizedBox sizedBox10 = const SizedBox(height: 10);


TextStyle appBarTextStyle(CallBridgeController controller) => TextStyle(
    color: controller.screenOnOffColor(),
    fontWeight: FontWeight.w900,
    fontSize: 20);