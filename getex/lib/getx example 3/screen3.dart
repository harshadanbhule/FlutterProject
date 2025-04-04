import 'package:app1/getx%20example%203/FruitControlloer.dart';
import 'package:app1/getx%20example%203/nextscreen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  Fruitcontrolloer controller=Get.put(Fruitcontrolloer());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List getx example"),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:controller.fruitList.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(controller.fruitList[index].toString()),
                    onTap: (){
                      if(controller.tempFruitList.contains(controller.fruitList[index].toString())){
                        controller.removeToFavourite(controller.fruitList[index].toString());
                      }else{
                        controller.addToFavourite(controller.fruitList[index].toString());
                      }
                      setState(() {
                        
                      });
                    },
                    trailing: Obx(()=>
                    Icon(Icons.favorite,color: controller.tempFruitList.contains(controller.fruitList[index].toString())? Colors.red : const Color.fromARGB(255, 50, 45, 45)))
                  ),
                );
              }),
          ),
            ElevatedButton(onPressed: (){
              Get.to(const Nextscreen3());
            }, child: const Text("Next Page"))
        ],
      ),
        
    );
    
  }
}