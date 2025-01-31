part of 'calculate_screen_controller.dart';

class _calculateState {
  ReactiveBool obscure = ReactiveBool(true);
  ReactiveBool isSecondStep = ReactiveBool(false);
  ReactiveInt totalCall = ReactiveInt(0);
  ReactiveBool isScreenOn = ReactiveBool(false);
  Reactive<Brightness> brightness = Brightness.light.reactiv;

  final FocusNode p1FocusNode = FocusNode();
  final FocusNode p2FocusNode = FocusNode();
  final FocusNode p3FocusNode = FocusNode();
  final FocusNode p4FocusNode = FocusNode();

  final FocusNode pp1FocusNode = FocusNode();
  final FocusNode pp2FocusNode = FocusNode();
  final FocusNode pp3FocusNode = FocusNode();
  final FocusNode pp4FocusNode = FocusNode();

  /// call controller
  TextEditingController player1CallTEC = TextEditingController();
  TextEditingController player2CallTEC = TextEditingController();
  TextEditingController player3CallTEC = TextEditingController();
  TextEditingController player4CallTEC = TextEditingController();

  /// withdraw controller
  TextEditingController player1WithdrawTEC = TextEditingController();
  TextEditingController player2WithdrawTEC = TextEditingController();
  TextEditingController player3WithdrawTEC = TextEditingController();
  TextEditingController player4WithdrawTEC = TextEditingController();

  clearAllTEC() {
    player1CallTEC.clear();
    player2CallTEC.clear();
    player3CallTEC.clear();
    player4CallTEC.clear();
    player1WithdrawTEC.clear();
    player2WithdrawTEC.clear();
    player3WithdrawTEC.clear();
    player4WithdrawTEC.clear();
  }
}
