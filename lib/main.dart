import 'package:card_game_calculator/presentation/calculate_page/controller/calculate_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:reactiv/reactiv.dart';
import 'presentation/homepage/homepage.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  //
  // await Hive.initFlutter();
  // Hive.registerAdapter(PlayerNameModelAdapter());
  // await HiveServices.instance.openBox();

  runApp(const MyApp());
}

class MyApp extends ReactiveStateWidget<CalculateScreenController> {
  @override
  BindController<CalculateScreenController>? bindController() {
    // TODO: implement bindController
    return BindController(controller: () => CalculateScreenController());
  }

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(
        listenable: controller.state.brightness,
        listener: (brightness) {
          return MaterialApp(
            theme: ThemeData(
              appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
              brightness: controller.state.brightness.value,
            ),
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        });
  }
}
