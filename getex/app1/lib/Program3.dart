import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Program3 extends StatefulWidget {
  /*final String name;
  const Program3({super.key,this.name=''});*/ //this data pass use when we use navigator
  var name;// this method use when we get data dynamically using argument when we use routes in getex
  Program3({super.key,this.name});
  @override
  State<Program3> createState() => _Program3State();
}

class _Program3State extends State<Program3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Screen 2"+Get.arguments[1]),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            /*Navigator.pop(context);*/
           // Get.back();
           Get.toNamed('/Page1');
          }, child: const Text("To page 1"))
        ],
      ),
    );
  }
}