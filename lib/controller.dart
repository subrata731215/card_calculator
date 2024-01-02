import 'package:flutter/cupertino.dart';
import 'package:reactiv/reactiv.dart';

class DataController extends ReactiveController {
  ReactiveInt scoreboardRound=ReactiveInt(0);
  ReactiveInt callTotal = ReactiveInt(0);
  ReactiveBool isObscureText = ReactiveBool(true);



  List<PlayerModel> allPlayerList = [
    PlayerModel(
        playerName: 'Sumanta'.toUpperCase(),
        inputCall: ReactiveInt(0),
        totalCall: ReactiveInt(0)),
    PlayerModel(
        playerName: 'Kala'.toUpperCase(),
        inputCall: ReactiveInt(0),
        totalCall: ReactiveInt(0)),
    PlayerModel(
        playerName: 'Satya Da'.toUpperCase(),
        inputCall: ReactiveInt(0),
        totalCall: ReactiveInt(0)),
    PlayerModel(
        playerName: 'Joydeb Da'.toUpperCase(),
        inputCall: ReactiveInt(0),
        totalCall: ReactiveInt(0)),
  ];

  ReactiveInt player1Call = ReactiveInt(0);
  ReactiveInt player2Call = ReactiveInt(0);
  ReactiveInt player3Call = ReactiveInt(0);
  ReactiveInt player4Call = ReactiveInt(0);

  ReactiveList<int> player1CallList = ReactiveList([]);
  ReactiveList<int> player2CallList = ReactiveList([]);
  ReactiveList<int> player3CallList = ReactiveList([]);
  ReactiveList<int> player4CallList = ReactiveList([]);


  int player1Point() {
    int sum = 0;
    for (int i in player1CallList) {
      sum += i;
    }
    return sum;
  }

  int player2Point() {
    int sum = 0;
    for (int i in player2CallList) {
      sum += i;
    }
    return sum;
  }

  int player3Point() {
    int sum = 0;
    for (int i in player3CallList) {
      sum += i;
    }
    return sum;
  }

  int player4Point() {
    ReactiveInt sum = ReactiveInt(0);
    for (int i in player4CallList) {
      sum.value += i;
    }
    return sum.value;
  }

  void callConfirm() {
    int total = player1Call.value +
        player2Call.value +
        player3Call.value +
        player4Call.value;
    callTotal.value = total;
    isObscureText.value = false;
  }

  void nextButton() {

      player1CallList.add(player1Call.value);
      player2CallList.add(player2Call.value);
      player3CallList.add(player3Call.value);
      player4CallList.add(player4Call.value);



    player1Call.value = 0;
    player2Call.value = 0;
    player3Call.value = 0;
    player4Call.value = 0;

    isObscureText.value = true;
  }
}

class PlayerModel {
  String playerName;

  ReactiveInt inputCall;
  ReactiveInt totalCall;

  PlayerModel(
      {required this.playerName,
      required this.inputCall,
      required this.totalCall});
}


