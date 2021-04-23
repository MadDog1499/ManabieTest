import 'package:manabie/model/todo.dart';
import 'package:manabie/redux/actions.dart';

AppState reducer(AppState previousState, dynamic action) {
  return AppState(todoList: todoRecuder(previousState.todoList, action));
}

List<Todo> todoRecuder(List<Todo> state, dynamic action) {
  if (action is AddTodoAction) {
    return []
      ..addAll(state)
      ..add(Todo(
          title: action.title,
          description: action.description,
          state: action.state));
  } else {
    if (action is ChangeTodoStateAction) {
      // Copy current list to "a" list for
      action.todo.state = action.state;
    }
  }
  return state;
}
