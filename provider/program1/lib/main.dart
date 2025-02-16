import 'package:flutter/material.dart';
import 'package:program1/countProvider.dart';
import 'package:program1/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:ChangeNotifierProvider(
        create: (context) =>Countprovider() ,
        child:const Home(),
      )
    );
  }
}
