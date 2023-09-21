import 'package:flutter/material.dart';
import 'package:todolist/component/my_text.dart';
import 'package:todolist/component/todolist.dart';

class TodoListContainer extends StatelessWidget {
  const TodoListContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(size);
    return Container(
      padding: EdgeInsets.symmetric(horizontal:20 ),
      child: Column(
        children: [
          MyTextField(),
          Expanded(child: ToDoList()),
        ],
      ),
    );
  }
}
