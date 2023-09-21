import 'package:todolist/base/base_bloc.dart';
import 'package:todolist/base/base_event.dart';

class AddToDo extends BaseEvent{
  String content;

  AddToDo(this.content);
}