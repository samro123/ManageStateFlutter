import 'package:bloc/homepage.dart';
import 'package:bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: //Prodiver
           Provider<SearchBloc>.value(value: SearchBloc(), child: HomePage(),),
    );
  }
}


