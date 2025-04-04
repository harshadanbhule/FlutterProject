import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Program1 extends StatefulWidget {
  const Program1({super.key});

  @override
  State<Program1> createState() => _Program1State();
}

class _Program1State extends State<Program1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: Text("Gtex"),
              subtitle: Text("Dialogue Box"),
              onTap: () {
                Get.defaultDialog(
                    title: "Good night",
                    titlePadding: EdgeInsets.all(30),
                    contentPadding: EdgeInsets.all(10),
                    //middleText: "Good morning",
                    textCancel: "hola",
                    content: const Column(
                      children: [
                        Text("harshad"),
                        Text("harshad"),
                        Text("harshad"),
                        Text("harshad"),
                      ],
                    ),
                    confirm: TextButton(
                        onPressed: () {
                          // Navigator.pop(context);
                          Get.back();
                        },
                        child: const Text("ok")));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text("Gtex"),
              subtitle:const Text("Bottom sheet"),
              onTap: (){
                Get.bottomSheet(
                  
                Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.light_mode),
                          title: const Text("Light Theme"),
                          onTap: (){
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.dark_mode),
                          title: const Text("Dark Theme"),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        )
                      ],
                    ),
                  )
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
