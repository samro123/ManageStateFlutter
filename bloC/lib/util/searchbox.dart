import 'package:bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  // contructor truyen du lieu widget sang widget bloc
  // final SearchBloc bloc;
  // SearchBox({required this.bloc});
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchControlor = TextEditingController();


  //bloc
  @override
  void initState() {
    super.initState();

      //lay gia tri tren textflied de so sanh vs du lieu
      //khua nay cua bloc
      // widget.bloc.search(searchControlor.text);

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<SearchBloc>(context);
    searchControlor.addListener(() {
      bloc.search(searchControlor.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    // Provider con conmer
    return Consumer<SearchBloc>(
      builder: (context, value, child) => Container(
        padding: EdgeInsets.all(20),
        child: TextField(
          controller: searchControlor,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40)
            )
          ),
        ),
      ),
    );
  }
}
