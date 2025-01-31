// import 'package:hive_flutter/adapters.dart';
//
// class HiveServices {
//   HiveServices._();
//
//   static HiveServices instance = HiveServices._();
//
//   Box<PlayerNameModel>? _box;
//
//   Future<void> openBox() async {
//     _box = await Hive.openBox<PlayerNameModel>('PlayerNameBox');
//   }
//
//   Future<void> closeBox() async {
//     await _box!.close();
//   }
//
//   Future<List<PlayerNameModel>> getPlayerName() async {
//     if (_box == null) {
//       await openBox();
//     }
//     return _box!.values.toList();
//   }
//
//   Future<void> addUser(PlayerNameModel playerNameModel) async {
//     if (_box == null) {
//       await openBox();
//     }
//     await _box!.add(playerNameModel);
//   }
//
//   Future<void> deleteUserAt(int index) async {
//     if (_box == null) {
//       await openBox();
//     }
//     await _box!.deleteAt(index);
//   }
//
//   Future<void> updateHiveUser(int index, PlayerNameModel playerNameModel) async {
//     if (_box == null) {
//       await openBox();
//     }
//     await _box!.putAt(index, playerNameModel);
//   }
// }
