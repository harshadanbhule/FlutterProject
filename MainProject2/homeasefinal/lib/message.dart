import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeasefinal/homepage.dart';
import 'package:homeasefinal/notification.dart';

class Messageon extends StatefulWidget {
  const Messageon({super.key});
//under 
  @override
  State<Messageon> createState() => _MessageonState();
}

class _MessageonState extends State<Messageon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
  
      body: Column(
        children: [
          Text("Message")
        ],
      ),
    );
  }
}