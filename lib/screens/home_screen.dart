import 'package:flutter/material.dart';
import 'package:flutter_todogetx/controllers/todo_controller.dart';
import 'package:flutter_todogetx/screens/todo_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());

    return Scaffold(
      appBar: AppBar(title: Text('Todo: GetX Practice')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Obx(() => ListView.separated(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            onDismissed: (_) {
              var removed = todoController.toDos[index];
              todoController.toDos.removeAt(index);
              Get.snackbar('Task Removed', 'Task ${removed.text} was removed.');
            },
            child: ListTile(
                  title: Text(
                    todoController.toDos[index].text,
                    style: (todoController.toDos[index].done)
                        ? const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,)
                        : TextStyle(
                            color: Theme.of(context).textTheme.bodyText1!.color,
                          ),
                  ),
                  onTap: () {},
                  trailing: Checkbox(
                    value: todoController.toDos[index].done,
                    onChanged: (value) {
                      var changed = todoController.toDos[index];
                      changed.done = value!;
                      todoController.toDos[index] = changed;
                    },
                  ),
                ),
          ),
          separatorBuilder: (_, __) => Divider(),
          itemCount: todoController.toDos.length)),
    );
  }
}
