import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';

class CallBridgeController extends ReactiveController {
  final ReactiveInt scoreboardRound = ReactiveInt(0);

  ReactiveBool obscure = ReactiveBool(true);
  ReactiveBool isScreenOn=ReactiveBool(false);

  /// playerName

  ReactiveString player1Name = ReactiveString('');
  ReactiveString player2Name = ReactiveString('');
  ReactiveString player3Name = ReactiveString('');
  ReactiveString player4Name = ReactiveString('');

  /// call controller
  TextEditingController player1CallController = TextEditingController();
  TextEditingController player2CallController = TextEditingController();
  TextEditingController player3CallController = TextEditingController();
  TextEditingController player4CallController = TextEditingController();

  /// withdraw controller
  TextEditingController player1WithdrawCallController = TextEditingController();
  TextEditingController player2WithdrawCallController = TextEditingController();
  TextEditingController player3WithdrawCallController = TextEditingController();
  TextEditingController player4WithdrawCallController = TextEditingController();

  /// total Withdraw
  int totalWithdrawCall() {
    int sum = int.parse(player1WithdrawCallController.text) +
        int.parse(player2WithdrawCallController.text) +
        int.parse(player3WithdrawCallController.text) +
        int.parse(player4WithdrawCallController.text);
    return sum;
  }

  /// Score add to List

  int p1score = 0;
  int p2score = 0;
  int p3score = 0;
  int p4score = 0;

  int player1Score() {
    if (int.parse(player1WithdrawCallController.text) <
            int.parse(player1CallController.text) ||
        int.parse(player1WithdrawCallController.text) >=
            int.parse(player1CallController.text) + 2) {
      p1score = -int.parse(player1CallController.text);
    } else if (int.parse(player1CallController.text) >= 8) {
      p1score = int.parse(player1CallController.text) * 2;
    } else {
      p1score = int.parse(player1CallController.text);
    }
    return p1score;
  }

  int player2Score() {
    if (int.parse(player2WithdrawCallController.text) <
            int.parse(player2CallController.text) ||
        int.parse(player2WithdrawCallController.text) >=
            int.parse(player2CallController.text) + 2) {
      p2score = -int.parse(player2CallController.text);
    } else if (int.parse(player2CallController.text) >= 8) {
      p2score = int.parse(player2CallController.text) * 2;
    } else {
      p2score = int.parse(player2CallController.text);
    }
    return p2score;
  }

  int player3Score() {
    if (int.parse(player3WithdrawCallController.text) <
            int.parse(player3CallController.text) ||
        int.parse(player3WithdrawCallController.text) >=
            int.parse(player3CallController.text) + 2) {
      p3score = -int.parse(player3CallController.text);
    } else if (int.parse(player3CallController.text) >= 8) {
      p3score = int.parse(player3CallController.text) * 2;
    } else {
      p3score = int.parse(player3CallController.text);
    }
    return p3score;
  }

  int player4Score() {
    if (int.parse(player4WithdrawCallController.text) <
            int.parse(player4CallController.text) ||
        int.parse(player4WithdrawCallController.text) >=
            int.parse(player4CallController.text) + 2) {
      p4score = -int.parse(player4CallController.text);
    } else if (int.parse(player4CallController.text) >= 8) {
      p4score = int.parse(player4CallController.text) * 2;
    } else {
      p4score = int.parse(player4CallController.text);
    }
    return p4score;
  }

  /// confirm Button
  ReactiveInt totalCall = ReactiveInt(0);

  void confirmButton() {
    if (player1CallController.text.isNotEmpty &&
        player2CallController.text.isNotEmpty &&
        player3CallController.text.isNotEmpty &&
        player4CallController.text.isNotEmpty) {
      int sum = int.parse(player1CallController.text) +
          int.parse(player2CallController.text) +
          int.parse(player3CallController.text) +
          int.parse(player4CallController.text);
      totalCall.value = sum;
      obscure.value = false;
    }
  }

  /// next Button
  void nextButton() {
    if (player1WithdrawCallController.text.isNotEmpty &&
        player2WithdrawCallController.text.isNotEmpty &&
        player3WithdrawCallController.text.isNotEmpty &&
        player4WithdrawCallController.text.isNotEmpty &&
        totalWithdrawCall() == 13) {
      obscure.value = true;

      /// ScoreBoard
      scoreboardRound.value++;

      /// Total call  0
      totalCall.value = 0;

      /// score
      player1Score();
      player2Score();
      player3Score();
      player4Score();

      /// add to list
      player1CallList.add(p1score);
      player2CallList.add(p2score);
      player3CallList.add(p3score);
      player4CallList.add(p4score);

      /// textField Clear
      player1CallController.clear();
      player2CallController.clear();
      player3CallController.clear();
      player4CallController.clear();

      player1WithdrawCallController.clear();
      player2WithdrawCallController.clear();
      player3WithdrawCallController.clear();
      player4WithdrawCallController.clear();
    }
  }

  /// call List

  ReactiveList<int> player1CallList = ReactiveList([0]);
  ReactiveList<int> player2CallList = ReactiveList([0]);
  ReactiveList<int> player3CallList = ReactiveList([0]);
  ReactiveList<int> player4CallList = ReactiveList([0]);

  /// total Score
  int p1TotalScore() {
    int sum = 0;
    for (var element in player1CallList) {
      sum += element;
    }
    return sum;
  }

  int p2TotalScore() {
    int sum = 0;
    for (var element in player2CallList) {
      sum += element;
    }
    return sum;
  }

  int p3TotalScore() {
    int sum = 0;
    for (var element in player3CallList) {
      sum += element;
    }
    return sum;
  }

  int p4TotalScore() {
    int sum = 0;
    for (var element in player4CallList) {
      sum += element;
    }
    return sum;
  }
}
