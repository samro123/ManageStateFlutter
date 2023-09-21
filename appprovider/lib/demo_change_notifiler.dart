import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//lang nge thay doi cua 1 object
// k can call setState khi su dung ChangeNotifier
class Counter with ChangeNotifier{
  int _count = 0;

  int get count => _count;
  increment(){
    _count ++;
    // moi lan object thay doi phai call notifyListener
    notifyListeners();
  }
}

class DemoChangeNotifiler extends StatelessWidget {
  const DemoChangeNotifiler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
        create: (context) => Counter(),
        child: TestWidget(),
        );
  }
}

class TestWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    Counter counter = Provider.of<Counter>(context);
    return Center(
      child: Container(
        child: Column(
          children: [
            Text(counter.count.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            ElevatedButton(onPressed: (){
              counter.increment();
            }, child: Text('Increment'))
          ],
        ),
      ),
    );
  }
}

