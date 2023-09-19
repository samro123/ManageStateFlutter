import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/event/add_todo.dart';
import 'package:todolist/event/deleted_todo.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtController = TextEditingController();
    final bloc = Provider.of<TodoBloc>(context);
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: txtController,
            decoration: InputDecoration(
              hintText: 'Add Todo',
              labelText: 'Add Todo'
            ),
          ),
        ),
        const SizedBox(width: 20,),
        ElevatedButton.icon(
            onPressed: (){
             bloc.event.add(AddToDo(txtController.text));
              //bloc.event.add(DeletedToDo());
            },
            icon: Icon(Icons.add),
            label: Text('Add'),
        )
      ],
    );
  }
}
