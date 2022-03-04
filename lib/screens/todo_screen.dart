import 'package:flutter/material.dart';
import 'package:flutter_todogetx/controllers/todo_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_todogetx/models/todo.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  final TodoController todoController = Get.find<TodoController>();
  final int index = 0;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(12, 45, 12, 12),
          child: Column(
            children: [
              Expanded(
                  child: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    decoration: const InputDecoration(
                        hintText: 'What do you want to do?',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none),
                    style: TextStyle(fontSize: 25),
                    keyboardType: TextInputType.multiline,
                    maxLines: 30,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      todoController.toDos.add(Todo(text: textEditingController.text));
                      Get.back();
                    },
                    child: Text('Add'),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
