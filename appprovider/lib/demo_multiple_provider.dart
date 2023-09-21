import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter1 with ChangeNotifier{
  int _count = 0 ;

  int get count => _count;
  increment(){
    _count ++ ;
    notifyListeners();
  }

}

class Counter2 with ChangeNotifier{
  int _count = 10 ;

  int get count => _count;
  increment(){
    _count ++ ;
    notifyListeners();
  }
}

class DemoMultipleProvider extends StatelessWidget {
  const DemoMultipleProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter1(),),
          ChangeNotifierProvider(create: (context) => Counter2(),)
        ],
    child: TestWidget1(),
    );

  }
}

class TestWidget1 extends StatelessWidget {
  const TestWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter1 counter1 = Provider.of<Counter1>(context);
    Counter2 counter2 = Provider.of<Counter2>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('count1 = ${counter1.count.toString()} count2 = ${counter2.count.toString()}'),
          ElevatedButton(onPressed: (){
            counter1.increment();
            counter2.increment();
          }, child: Text('Increment'))
        ],
      ),
    );
  }
}


// Demo 2 k rebuild widget
class Count3 {
  int _count = 0 ;

  int get count => _count;


  increment(){
    _count ++;
  }
}

class Count4 {
  int _count = 10 ;

  int get count => _count;


  increment(){
    print('sam');
    _count ++;
  }
}

class DemoMultipleProvider2 extends StatelessWidget {
  const DemoMultipleProvider2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Count3>.value(value: Count3()),
          Provider<Count4>.value(value: Count4()),
        ],
      child: TestWidget2(),
    );
  }
}

class TestWidget2 extends StatelessWidget {
  const TestWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Count3 counter3 = Provider.of<Count3>(context);
    Count4 counter4 = Provider.of<Count4>(context);

    return Center(
      child: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'count1 = ${counter3.count.toString()} count2 = ${counter4.count.toString()}',
                style: TextStyle(fontSize: 40),
              )
            ]),
      ),
    );
  }
}



