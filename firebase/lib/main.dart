
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tutorial1/Home.dart';
import 'package:tutorial1/Register.dart';

import 'package:tutorial1/firebase_options.dart';
import 'package:tutorial1/form.dart';
import 'package:tutorial1/location.dart';
import 'package:tutorial1/login.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  QuerySnapshot snapshot=await  FirebaseFirestore.instance.collection("users").get();
  for(var doc in snapshot.docs){
  log(doc.data().toString());
  }
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Auth UI',
        initialRoute: '/login',
        routes: {
        '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/home':(context) =>const Home(),
          
          '/form':(context)=> UserFormPage(),
          //'/location':(context)=> LocationMapPage()



        }
    );
  }
}

