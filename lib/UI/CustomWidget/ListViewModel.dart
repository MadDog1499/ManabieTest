import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manabie/model/ViewModel.dart';
import 'package:manabie/model/todo.dart';

class TodoListWiew extends StatefulWidget {
  final ViewModel model;
  final int indexScreen;

  const TodoListWiew({this.model, this.indexScreen});

  @override
  _TodoListWiewState createState() => _TodoListWiewState();
}

class _TodoListWiewState extends State<TodoListWiew> {
  @override
  Widget build(BuildContext context) {
    //Create templist to passing data from unmodifiable list
    List tempList = [];
    List<Todo> sortedList = [];
    // get list unmodfiable list
    List todoList1 = List.from(widget.model.todoList);
    //case for each type of screen was choose
    switch (widget.indexScreen) {
      case 0:
        // In case all Todo screen
        tempList = todoList1;
        break;
      case 1:
        // In case choose Completed Todo
        for (var item in todoList1) {
          if (item.state) {
            tempList.add(item);
          }
        }
        break;
      case 2:
        // In case choose Incomplete Todo
        for (var item in todoList1) {
          if (!item.state) {
            tempList.add(item);
          }
        }
        break;
      default:
        tempList = todoList1;
        break;
    }

    sortedList = new List.from(tempList.reversed);
    return ListView.builder(
      itemCount: sortedList.length,
      itemBuilder: (context, index) {
        //passing item to every Todo CARD
        return addItem(sortedList[index], widget.model);
      },
    );
  }
}

Widget addItem(Todo todoItem, ViewModel model) {
  return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 30,
          ),
        ],
      ),
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          //  Todo Title and description SECTION
          //
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(todoItem.title),
              subtitle: Text(todoItem.description),
            ),
          ),
          //
          //  CHECH BOX SECTION
          //
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Text("State"),
                  Checkbox(
                      value: todoItem.state,
                      onChanged: (value) {
                        model.onUpdateTodoState(todoItem, value);
                      }),
                ],
              ))
        ],
      )));
}
