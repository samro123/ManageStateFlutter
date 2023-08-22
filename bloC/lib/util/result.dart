import 'package:bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
   // contructor truyen du lieu tu widget sang widget bloc
  // final SearchBloc bloc;
  // Result({required this.bloc});
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder:(context, bloc, child) => Container(
        child: StreamBuilder<List<String>>(
          initialData: [],
          stream: bloc.searchControlor.stream,
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return _buildRow(snapshot.data![index]);
                },);
        },),
      ),
    );
  }

  Widget _buildRow(String data){
    return Container(
      child: Text(data, style: TextStyle(fontSize: 17, color: Colors.blue),),
    );
  }
}
