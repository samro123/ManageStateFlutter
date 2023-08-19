import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi/models/shops.dart';
import 'package:sushi/page/cart_page.dart';
import 'package:sushi/page/intro.dart';
import 'package:sushi/page/menu.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) =>  MenuPage(),
        '/cartpage': (context) =>  CartPage(),
      },

    );
  }
}

