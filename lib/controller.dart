import 'package:flutter/cupertino.dart';
import 'package:reactiv/reactiv.dart';

class DataController extends ReactiveController {
  ReactiveInt callTotal = ReactiveInt(0);
  final ReactiveBool isInputReadonly = ReactiveBool(false);
  final ReactiveBool isWithrawReadonly = ReactiveBool(false);

  ReactiveBool isObscureText = ReactiveBool(true);

  List<String> allPlayerList = ['Sumanta', 'Kala', 'Satya Da', 'Joydeb Da'];

  ReactiveList<int> player1CallList = ReactiveList([]);
  ReactiveList<int> player2CallList = ReactiveList([]);
  ReactiveList<int> player3CallList = ReactiveList([]);
  ReactiveList<int> player4CallList = ReactiveList([]);

  TextEditingController player1CallController = TextEditingController();
  TextEditingController player2CallController = TextEditingController();
  TextEditingController player3CallController = TextEditingController();
  TextEditingController player4CallController = TextEditingController();

  TextEditingController player1WithrawCallController = TextEditingController();
  TextEditingController player2WithrawCallController = TextEditingController();
  TextEditingController player3WithrawCallController = TextEditingController();
  TextEditingController player4WithrawCallController = TextEditingController();

  int convertCallInputValue(controllerName) {
    int k = int.parse(controllerName.text);
    return k;
  }

  int convertCallWithrawValue(controllerName) {
    int k = int.parse(controllerName.text);
    return k;
  }

  ReactiveInt player1FinalResult = ReactiveInt(0);
  ReactiveInt player2FinalResult = ReactiveInt(0);
  ReactiveInt player3FinalResult = ReactiveInt(0);
  ReactiveInt player4FinalResult = ReactiveInt(0);


  void result1() {
    if (convertCallWithrawValue(player1WithrawCallController) <
            convertCallInputValue(player1CallController) ||
        convertCallWithrawValue(player1WithrawCallController) >
            convertCallInputValue(player1CallController) + 2) {
      player1FinalResult.value = -convertCallInputValue(player1CallController);
    } else {
      player1FinalResult.value = convertCallInputValue(player1CallController);
    }
  }

  void result2() {
    if (convertCallWithrawValue(player2WithrawCallController) <
        convertCallInputValue(player2CallController) ||
        convertCallWithrawValue(player2WithrawCallController) >
            convertCallInputValue(player2CallController) + 2) {
      player2FinalResult.value = -convertCallInputValue(player2CallController);
    } else {
      player2FinalResult.value = convertCallInputValue(player2CallController);
    }
  }

  void result3() {
    if (convertCallWithrawValue(player3WithrawCallController) <
        convertCallInputValue(player3CallController) ||
        convertCallWithrawValue(player3WithrawCallController) >
            convertCallInputValue(player3CallController) + 2) {
      player3FinalResult.value = -convertCallInputValue(player3CallController);
    } else {
      player3FinalResult.value = convertCallInputValue(player3CallController);
    }
  }

  void result4() {
    if (convertCallWithrawValue(player4WithrawCallController) <
        convertCallInputValue(player4CallController) ||
        convertCallWithrawValue(player4WithrawCallController) >
            convertCallInputValue(player4CallController) + 2) {
      player4FinalResult.value = -convertCallInputValue(player4CallController);
    } else {
      player4FinalResult.value = convertCallInputValue(player4CallController);
    }
  }

  int totalPlayerPoint(playerNo) {
    int sum = 0;
    for (int i in playerNo) {
      sum += i;
    }
    return sum;
  }

  void confirmButtonPress() {
    if (player1CallController.text.isNotEmpty &&
        player2CallController.text.isNotEmpty &&
        player3CallController.text.isNotEmpty &&
        player4CallController.text.isNotEmpty) {
      int total = convertCallInputValue(player1CallController) +
          convertCallInputValue(player2CallController) +
          convertCallInputValue(player3CallController) +
          convertCallInputValue(player4CallController);
      callTotal.value = total;
      isObscureText.value = false;
    }
  }

  void settleAllButton() {
    if (player1CallController.text.isNotEmpty &&
        player2CallController.text.isNotEmpty &&
        player3CallController.text.isNotEmpty &&
        player4CallController.text.isNotEmpty) {
      player1CallList.add(player1FinalResult.value);
      player2CallList.add(player2FinalResult.value);
      player3CallList.add(player3FinalResult.value);
      player4CallList.add(player4FinalResult.value);

      // player1Controller.clear();
      // player2Controller.clear();
      // player3Controller.clear();
      // player4Controller.clear();

      isObscureText.value = true;
      isInputReadonly.value=false;
    }
  }
}
