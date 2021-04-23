import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manabie/model/todo.dart';
import 'package:redux/redux.dart';
import 'redux/reducer.dart';
import 'UI/HomeScreen.dart';

void main() {
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: AppState.initialState());
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomeScreen()));
  }
}
