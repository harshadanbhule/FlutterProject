//import 'package:expense_manager/register_screen.dart';
//import 'package:expense_manager/splash_screen.dart';

import 'package:expense_manager/graph.dart';
import 'package:expense_manager/home_screen.dart';
import 'package:expense_manager/splash_screen.dart';
import 'package:flutter/material.dart';

import 'category.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
