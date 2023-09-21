import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoFutureProvider extends StatelessWidget {
  const DemoFutureProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<int>.value(
        value: getAge(),
        initialData: 0,
        child: DemoFutureWidget(),
    );
  }

  Future<int> getAge(){
    return Future.delayed(Duration(seconds: 1), () {
      return 500;
    },);
  }
}

class DemoFutureWidget extends StatelessWidget {
  const DemoFutureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
        builder: (context, value, child) {
          return Center(
            child: Text(value.toString(),
            style: TextStyle(fontSize: 20),
            ),
          );
        },
    );
  }
}

