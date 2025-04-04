import 'package:app1/getx%20example%202/CounterContoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  CounterController obj=Get.put(CounterController());//here we inject dependecy through object
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Opacity Controll using getx"),
      ),
      body: Center(
        child: Column(
          children: [
           Obx(()=>Container(
              height: 200,
              width: 200,
              color: Colors.red.withOpacity(obj.opacity.value),
            ),),
            const SizedBox(
              height: 200,
            ),
            Obx(()=>Slider(value: obj.opacity.value, onChanged: (value){
                obj.setOpacity(value);
            }))
          ],
        ),
      ),
    );
  }
}