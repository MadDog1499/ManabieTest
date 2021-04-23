import 'package:flutter_test/flutter_test.dart';
import 'package:manabie/UI/CustomWidget/add_todo_dialog.dart';
import 'package:manabie/model/todo.dart';
import 'package:manabie/redux/actions.dart';
import 'package:manabie/redux/reducer.dart';
import 'package:redux/redux.dart';

void main() {
  //THIS TEST MUST PASS
  group("Add Todo", () {
    test('should be Add able', () {
      Todo getTodo(AppState state) => state.todoList[0];
      final store = Store<AppState>(
        reducer,
        initialState: AppState.initialState(),
      );
      store.dispatch(AddTodoAction("Hello World", "Test adding todo", false));

      String title = "Hello World";

      expect(getTodo(store.state).title, title);
    });
    //THIS TEST MUST FAIL
    test('should not be Add able', () {
      Todo getTodo(AppState state) => state.todoList[0];
      final store = Store<AppState>(
        reducer,
        initialState: AppState.initialState(),
      );
      store.dispatch(AddTodoAction("Hello World", "Test adding todo", false));

      String title = "Hello";

      expect(getTodo(store.state).title, title);
    });
  });
}
