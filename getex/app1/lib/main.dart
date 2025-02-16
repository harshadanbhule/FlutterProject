import 'package:app1/Home.dart';
import 'package:app1/Program1.dart';
import 'package:app1/Program3.dart';
import 'package:app1/Program4.dart';
import 'package:app1/getex%20example%201/CounterScreen.dart';
import 'package:app1/getex%20example%201/counter.dart';
import 'package:app1/getx%20example%202/Screen.dart';
import 'package:app1/getx%20example%203/screen3.dart';
import 'package:app1/program2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:const Screen3(),
      debugShowCheckedModeBanner: false,
      getPages:[
          GetPage(name:'/Page1',page:()=>const Program2()),
          GetPage(name: '/Page2',page:()=> Program3())
      ]
    );
  }
}
/*
Home : getex snackbar
program1 : dialoguebox,bottombar,theme change like dark and light theme
Peogram 2 & Program3 : Gtex Navigation,routes and data movement from one screen to another
Program 4 : getex height and width ,mediaquery
GETEX EXAMPLE 1: counter.dart & CounterScreen.dart  counter using getx
Gtex example 2 : Opacity increse decrese using getx
getx example 3 : used list to contain favourite fruit when click on favourite icon using getx we add in list and fetch
*/