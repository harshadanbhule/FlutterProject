import 'dart:io';

import 'package:app1/getx%20imagepicker/ImagePickerController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  Imagepickercontroller controller=Get.put(Imagepickercontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ImagePicker Getx"
        ),
      ),
      body: Obx((){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                 backgroundColor: Colors.grey[300],
                 backgroundImage: controller.imagePath.isNotEmpty
              ? FileImage(File(controller.imagePath.toString()))
              : null,
                    ),
          
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                controller.getImage();
              }, child: const Text("Pick Image")),
            ],
          ),
        );
      })
    );
  }
}