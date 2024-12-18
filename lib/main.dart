import 'package:flutter/material.dart';
import 'package:hello_mart/home_page/home_screen.dart';
import 'package:hello_mart/start_selling/start_selling_screen.dart';

import 'bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const StartSellingScreen(),
    );
  }
}
