import 'package:app1/Program3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Program2 extends StatefulWidget {

  const Program2({super.key,});

  @override
  State<Program2> createState() => _Program2State();
}

class _Program2State extends State<Program2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page 1"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            // ignore: non_constant_identifier_names
            /*Navigator.push(context, MaterialPageRoute(builder: (Context)=>const Program3()));*/
           // Get.to(() => const Program3(name: "Harshad"));
           Get.toNamed('/Page2',arguments: [
            'Harshad',
            'Rohan'
        ]);//using routes

          }, child: const Text("To page 2"))
        ],
      ),
    );
  }
}