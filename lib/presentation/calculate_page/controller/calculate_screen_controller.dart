import 'package:card_game_calculator/infrastructure/model/player_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactiv/reactiv.dart';

part 'calculate_state.dart';

class CalculateScreenController extends ReactiveController {
  final state = _calculateState();

  ReactiveList<PlayerModel> playerList = ReactiveList([
    PlayerModel(playerName: 'player1', score: 0, scoreList: [], totalScore: 0),
    PlayerModel(playerName: 'player2', score: 0, scoreList: [], totalScore: 0),
    PlayerModel(playerName: 'player3', score: 0, scoreList: [], totalScore: 0),
    PlayerModel(playerName: 'player4', score: 0, scoreList: [], totalScore: 0),
  ]);

  int totalWithdrawCall() {
    int sum = int.parse(state.player1WithdrawTEC.text) +
        int.parse(state.player2WithdrawTEC.text) +
        int.parse(state.player3WithdrawTEC.text) +
        int.parse(state.player4WithdrawTEC.text);
    return sum;
  }

  int playerWiseTotalScore(List<int> list) {
    int sum = 0;
    sum = list.fold(sum, (p, e) => p + e);
    return sum;
  }

  int playerWiseSingleScore(String givenCall, String withdrawCall) {
    int score = 0;
    if (int.parse(withdrawCall) < int.parse(givenCall) ||
        int.parse(withdrawCall) >= int.parse(givenCall) + 2) {
      score = -int.parse(givenCall);
    } else if (int.parse(givenCall) >= 8) {
      score = int.parse(givenCall) * 2;
    } else {
      score = int.parse(givenCall);
    }
    return score;
  }

  void confirmButton(int index) {
    if (state.player1CallTEC.text.isNotEmpty &&
        state.player2CallTEC.text.isNotEmpty &&
        state.player3CallTEC.text.isNotEmpty &&
        state.player4CallTEC.text.isNotEmpty) {
      int sum = int.parse(state.player1CallTEC.text) +
          int.parse(state.player2CallTEC.text) +
          int.parse(state.player3CallTEC.text) +
          int.parse(state.player4CallTEC.text);

      state.totalCall.value = sum;
      state.obscure.value = false;
      state.isSecondStep.value = true;
    }
  }

  void saveButton() {
    if (state.player1WithdrawTEC.text.isNotEmpty &&
        state.player2WithdrawTEC.text.isNotEmpty &&
        state.player3WithdrawTEC.text.isNotEmpty &&
        state.player4WithdrawTEC.text.isNotEmpty &&
        totalWithdrawCall() == 13) {
      state.totalCall.value = 0;
      playerList[0]
          .scoreList
          .add(playerWiseSingleScore(state.player1CallTEC.text, state.player1WithdrawTEC.text));
      playerList[1]
          .scoreList
          .add(playerWiseSingleScore(state.player2CallTEC.text, state.player2WithdrawTEC.text));
      playerList[2]
          .scoreList
          .add(playerWiseSingleScore(state.player3CallTEC.text, state.player3WithdrawTEC.text));
      playerList[3]
          .scoreList
          .add(playerWiseSingleScore(state.player4CallTEC.text, state.player4WithdrawTEC.text));

      state.clearAllTEC();
      state.obscure.value = true;
      state.isSecondStep.value = false;
    }
  }

  void settleAllButton() {
    if (state.player1WithdrawTEC.text.isEmpty &&
        state.player2WithdrawTEC.text.isEmpty &&
        state.player3WithdrawTEC.text.isEmpty &&
        state.player4WithdrawTEC.text.isEmpty) {
      state.totalCall.value = 0;
      playerList[0]
          .scoreList
          .add(playerWiseSingleScore(state.player1CallTEC.text, state.player1CallTEC.text));
      playerList[1]
          .scoreList
          .add(playerWiseSingleScore(state.player2CallTEC.text, state.player2CallTEC.text));
      playerList[2]
          .scoreList
          .add(playerWiseSingleScore(state.player3CallTEC.text, state.player3CallTEC.text));
      playerList[3]
          .scoreList
          .add(playerWiseSingleScore(state.player4CallTEC.text, state.player4CallTEC.text));
      state.clearAllTEC();
      state.obscure.value = true;
      state.isSecondStep.value = false;
    }
  }
}
