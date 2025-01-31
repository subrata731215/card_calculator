import 'package:reactiv/controllers/reactive_controller.dart';
import 'package:reactiv/reactiv.dart';

class TotalScoreScreenController extends ReactiveController {
}

class PlayerTotalScore {
  int player1TotalScore;
  int player2TotalScore;
  int player3TotalScore;
  int player4TotalScore;

  PlayerTotalScore(
      {required this.player1TotalScore,
      required this.player2TotalScore,
      required this.player3TotalScore,
      required this.player4TotalScore});
}
