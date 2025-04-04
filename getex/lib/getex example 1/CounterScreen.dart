import 'package:app1/getex%20example%201/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counterscreen extends StatefulWidget {
  const Counterscreen({super.key});

  @override
  State<Counterscreen> createState() => _CounterscreenState();
}

class _CounterscreenState extends State<Counterscreen> {
  final Counter controller=Get.put(Counter());
  @override 
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Getx counter"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        controller.incrementCounter();
      },
      child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(()=>Text(/*"${controller.count}"*/ controller.count.toString())),
          ],
        ),
      ),
    );
  }
}