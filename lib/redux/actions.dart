import 'package:manabie/model/todo.dart';

class AddTodoAction {
  final String title;
  final String description;
  bool state;
  AddTodoAction(this.title, this.description, this.state);
}

class ChangeTodoStateAction {
  final Todo todo;
  final bool state;
  ChangeTodoStateAction(this.todo, this.state);
}
