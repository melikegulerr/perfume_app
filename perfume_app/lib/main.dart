import 'package:flutter/material.dart';
import 'package:perfume_app/cart_page.dart';

import 'package:perfume_app/home_page.dart';

import 'package:perfume_app/intro_page.dart';
import 'package:perfume_app/shop.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    ),
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
        "/intropage": (context) => IntroPage(),
        "/homepage": (context) => HomePage(),
        "/cartpage": (context) => CartPage(),
      },
    );
  }
}
