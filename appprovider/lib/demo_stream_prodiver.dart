import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoStreamProvider extends StatelessWidget {
  const DemoStreamProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>.value(
        value: getAge(),
        initialData: 0,
      child: TestWidget(),
    );
  }

  Stream<int> getAge(){
    return Stream.fromFuture(Future.delayed(Duration(seconds: 1), () {
          return 250;
    },));
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<int>(
        builder: (context, value, child) {
          return Center(
            child: Text(value.toString()),
          );
        },
    );
  }
}

