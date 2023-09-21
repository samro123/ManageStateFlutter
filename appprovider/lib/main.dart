import 'package:appprovider/basic.dart';
import 'package:appprovider/demo_future_provider.dart';
import 'package:appprovider/demo_proxy_provider.dart';
import 'package:appprovider/demo_stream_prodiver.dart';
import 'package:appprovider/demo_value_listenable_provider.dart';
import 'package:flutter/material.dart';

import 'demo_change_notifiler.dart';
import 'demo_multiple_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Provider'),
        ),
        body: DemoStreamProvider(),
      ),
    );
  }
}


