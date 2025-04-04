
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Color bgColor=Colors.black;
  void colorchange(){
    if(bgColor==Colors.black){
      bgColor=Colors.red;
    }else{
      bgColor=Colors.black;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Hello",style: TextStyle(
          color: Colors.orange
        ),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.snackbar("Hello", "mf",
        icon: const Icon(
          Icons.add),
          onTap: (snack) {
            colorchange();
            setState(() {
              
            });
          },
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        backgroundColor: Colors.yellow
        );
      }),
    );
  }
}