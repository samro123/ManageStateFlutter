import 'package:todolist/base/base_event.dart';
import 'package:todolist/model/todo.dart';

class DeletedToDo extends BaseEvent{
    Todo todo;

    DeletedToDo(this.todo);
}