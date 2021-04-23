import 'package:flutter/material.dart';
import 'package:manabie/UI/CustomWidget/flush_bar.dart';
import 'dart:core';
import 'package:manabie/model/ViewModel.dart';

showAddNoteDialog(
    BuildContext context, ViewModel viewModel, List<String> titleList) {
  final todoTitle = TextEditingController();
  final todoDescription = TextEditingController();

  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            insetPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: new Container(
              width: double.infinity,
              height: 300,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Create New Todo',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          controller: todoTitle,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Todo Title",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextField(
                          maxLines: 3,
                          controller: todoDescription,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter Todo Description",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: OutlineButton(
                              splashColor: Colors.redAccent,
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.redAccent),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          )),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: OutlineButton(
                                splashColor: Colors.greenAccent,
                                child: new Text(
                                  'Create',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent),
                                ),
                                onPressed: () {
                                  // CHECK IF TITLE AND DESCRIPTION ARE VALID
                                  var validateResult =
                                      ValidateTitleAndDescription.validate(
                                          todoTitle.text,
                                          todoDescription.text,
                                          titleList);
                                  switch (validateResult) {
                                    case -1:
                                      showErrorFlushbar(context,
                                          "Todo title and description can not be empty!");
                                      break;
                                    case 0:
                                      showErrorFlushbar(context,
                                          "Todo Title already exist.Please choose another title!");
                                      break;
                                    case 1:
                                      Navigator.of(context).pop();
                                      viewModel.onAddTodo(todoTitle.text,
                                          todoDescription.text, false);
                                      showFlushbar(context, "Todo created");
                                      titleList.add(todoTitle.text);
                                      break;
                                    default:
                                  }
                                },
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ));
      });
}

class ValidateTitleAndDescription {
  static int validate(String title, String description, List<String> list) {
    var a = title.isEmpty || description.isEmpty
        ? -1
        : list.contains(title)
            ? 0
            : 1;
    return a;
  }
}
