import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterApi{
  int _count = 10;
  int get count => _count;

}

class CounterService{
  CounterApi _api;
  CounterService({required CounterApi api}) : _api = api;
  CounterApi get api => _api;
}

class CounterModel with ChangeNotifier {
  CounterService _counterService;
  CounterModel({required CounterService counterService}) : _counterService = counterService;
  CounterService get  counterService => _counterService;
}

class DemoProxyProvider extends StatelessWidget {
  const DemoProxyProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            Provider.value(value: CounterApi()),
            ProxyProvider<CounterApi, CounterService>(
              update: (context, value, previous) => CounterService(api: value),
            )
         ],
        child: TestWidget(),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterModel>.value(
      value: CounterModel(counterService: Provider.of(context)),
      child: Consumer<CounterModel>(
        builder: (context, value, child) => Center(
          child: Container(
            child: Column(
              children: [
                Text(value.counterService.api.count.toString())
              ],
            ),
          ),
        ),
      ),
    );
  }
}


