import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:manabie/UI/CustomWidget/ListViewModel.dart';
import 'package:manabie/model/ViewModel.dart';
import 'package:manabie/model/todo.dart';
import 'package:redux/redux.dart';

import 'CustomWidget/add_todo_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // init page index
  int currentIndex = 0;
  List<String> titleList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
          centerTitle: true,
        ),
        body: Container(
          child: StoreConnector<AppState, ViewModel>(
              converter: (Store<AppState> store) => ViewModel.create(store),
              builder: (context, viewModel) => Column(
                    children: [
                      //PASSING VIEWMODEL AND CURRENT PAGE TO SHOW LIST VIEW
                      Expanded(
                          child: TodoListWiew(
                        model: viewModel,
                        indexScreen: currentIndex,
                      )),
                    ],
                  )),
        ),
        bottomNavigationBar: Builder(builder: (BuildContext context) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "All Todo"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.group_sharp), label: "Completed Todo"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_sharp), label: "Incomplete Todo"),
            ],
            //ontap action
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          );
        }),
        floatingActionButton: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (context, vm) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                showAddNoteDialog(context, vm, titleList);
              },
            );
          },
        ));
  }
}
