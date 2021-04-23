import 'package:redux/redux.dart';
import 'package:manabie/model/todo.dart';
import 'package:manabie/redux/actions.dart';

class ViewModel {
  final List<Todo> todoList;
  final Function(String, String, bool) onAddTodo;
  final Function(Todo, bool) onUpdateTodoState;

  ViewModel(this.todoList, this.onAddTodo, this.onUpdateTodoState);
  factory ViewModel.create(Store<AppState> store) {
    _onAddTodo(String title, String description, bool state) {
      store.dispatch(AddTodoAction(title, description, state));
    }

    _onUpdateTodoState(Todo todo, bool state) {
      store.dispatch(ChangeTodoStateAction(todo, state));
    }

    return ViewModel(
      store.state.todoList,
      _onAddTodo,
      _onUpdateTodoState,
    );
  }
}
