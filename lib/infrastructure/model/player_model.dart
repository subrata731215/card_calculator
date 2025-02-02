import 'package:reactiv/reactiv.dart';

class PlayerModel {
  ReactiveString playerName;
  List<int> scoreList;

  PlayerModel({required this.playerName, required this.scoreList});

  int get totalScore {
    int sum = 0;
    sum = scoreList.fold(sum, (p, n) => p + n);
    return sum;
  }
}
