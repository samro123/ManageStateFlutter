import 'package:bloc/search_bloc.dart';
import 'package:bloc/util/result.dart';
import 'package:bloc/util/searchbox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      body: Container(
        child: Column(
          children: [
            SearchBox(),
            Expanded(child: Result(),)
          ],
        ),
      ),
    );
  }
}
