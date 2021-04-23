import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;
  bool state;

  Todo(
      {@required this.title, @required this.description, @required this.state});

  set setState(bool state) {
    this.state = state;
  }
}

class AppState {
  List<Todo> todoList;

  AppState({@required this.todoList});

  AppState.initialState() : todoList = List.unmodifiable(<Todo>[]);
}
