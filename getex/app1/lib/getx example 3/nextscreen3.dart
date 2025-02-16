import 'package:app1/getx%20example%203/FruitControlloer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Nextscreen3 extends StatefulWidget {
  const Nextscreen3({super.key});

  @override
  State<Nextscreen3> createState() => _Nextscreen3State();
}

class _Nextscreen3State extends State<Nextscreen3> {
  Fruitcontrolloer controller=Get.put(Fruitcontrolloer());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Fvaourite fruits"),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Get.back(); 
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.tempFruitList.length,
              itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text(controller.tempFruitList[index].toString()),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}