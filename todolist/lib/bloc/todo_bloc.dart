import 'dart:async';
import 'dart:math';
import 'package:todolist/base/base_bloc.dart';
import 'package:todolist/base/base_event.dart';
import 'package:todolist/db/todo_table.dart';
import 'package:todolist/event/add_todo.dart';
import 'package:todolist/event/deleted_todo.dart';
import 'package:todolist/model/todo.dart';

class TodoBloc extends BaseBloc{

  TodoTable _todoTable = TodoTable();

  StreamController<List<Todo>> _todoListStreamController = StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream => _todoListStreamController.stream;

  //random id
  var _randomInt = Random();
  //list de hien thi ra list du lieu
  List<Todo> _todoListData = [];

  initData() async{
    _todoListData = await _todoTable.selectAllTodo();
    if(_todoListData == null){
      return;
    }
    _todoListStreamController.sink.add(_todoListData);

  }

  _addTodo(Todo todo) async{
    //insert database
    await _todoTable.insertTodo(todo);


    _todoListData.add(todo);
    //dung sink day event ra
    _todoListStreamController.sink.add(_todoListData);
  }
  _delectTodo(Todo todo) async {
    await _todoTable.deletedTodo(todo);

    _todoListData.remove(todo);
    //dung sink day event ra
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  void dispatchEvent(BaseEvent event) {
      if(event is AddToDo){
        Todo todo = Todo(_randomInt.nextInt(1000000), event.content);
        _addTodo(todo);

      }else if(event is DeletedToDo){
          _delectTodo(event.todo);
      }


    }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _todoListStreamController.close();
  }


}