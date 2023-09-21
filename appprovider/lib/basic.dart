import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class User {
  String _name;

  User(this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}

class BasicProdiver extends StatelessWidget {
  const BasicProdiver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user =User('');
    user._name = "Sam Pro";

    return Provider<User>.value(
      value: user,
      child: BasicWidget(),
    );
  }
}

class BasicWidget extends StatelessWidget {
  const BasicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          DemoConsumerWidget(),
          WithoutConsumerWidget(),
        ],
      ),
    );
  }
}

class DemoConsumerWidget extends StatelessWidget {
  const DemoConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User>(builder: (context, value, child) => Text(value.name),);
  }
}

class WithoutConsumerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return  Container(
      child: Text(user.name),
    );
  }
}



