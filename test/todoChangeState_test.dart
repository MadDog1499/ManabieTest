import 'package:flutter_test/flutter_test.dart';
import 'package:manabie/model/todo.dart';
import 'package:manabie/redux/actions.dart';
import 'package:manabie/redux/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  group("Change Todo State Test", () {
    //THIS TEST MUST PASS
    test('- state change', () {
      Todo getTodo(AppState state) => state.todoList[0];
      final store = Store<AppState>(
        reducer,
        initialState: AppState.initialState(),
      );
      Todo test_todo = Todo(
          title: "Test State",
          description: "Test Changing State",
          state: false);
      store.dispatch(AddTodoAction(
          test_todo.title, test_todo.description, test_todo.state));

      store.dispatch(ChangeTodoStateAction(test_todo, true));

      expect(getTodo(store.state).state, true);
    });

    //THIS TEST MUST FAIL
    test('- state not change', () {
      Todo getTodo(AppState state) => state.todoList[0];
      final store = Store<AppState>(
        reducer,
        initialState: AppState.initialState(),
      );
      Todo test_todo = Todo(
          title: "Test State",
          description: "Test Changing State",
          state: false);
      store.dispatch(AddTodoAction(
          test_todo.title, test_todo.description, test_todo.state));

      store.dispatch(ChangeTodoStateAction(test_todo, true));

      expect(getTodo(store.state).state, false);
    });
  });
}
