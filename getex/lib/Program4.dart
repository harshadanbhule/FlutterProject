import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Program4 extends StatefulWidget {
  const Program4({super.key});

  @override
  State<Program4> createState() => _Program4State();
}

class _Program4State extends State<Program4> {
 
  @override
  Widget build(BuildContext context) {
     final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getex height and mediaquery"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height:height *.8,
            width: Get.height*.4,

          )
        ],
      ),
    );
  }
}