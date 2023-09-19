import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/event/deleted_todo.dart';
import 'package:todolist/model/todo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
      builder: (context, value, child) => StreamBuilder<List<Todo>>(
        stream: value.todoListStream,
        builder:(context, snapshot) {
          switch(snapshot.connectionState){
            //du lieu day tu stream ra
            case ConnectionState.active:
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].content),
                    trailing: GestureDetector(
                      onTap: (){
                        value.event.add(DeletedToDo(snapshot.data![index]));
                      },
                      child: Icon(Icons.delete, color: Colors.red[400],),
                    ),
                  );
                },
              );
            case ConnectionState.waiting:
               return Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: Text('Empty', style: TextStyle(fontSize: 20),),
                ),
              );
            case ConnectionState.none:
            default:
              return Center(
                child: Container(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(),
                ),
              );
          }
        }
      ),
         );
  }
}
