import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/bloc/todo_bloc.dart';
import 'package:todolist/db/todo_database.dart';
import 'package:todolist/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await TodoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider<TodoBloc>.value(
           value: TodoBloc(),
          child: HomePage()
      ),
    );
  }
}


