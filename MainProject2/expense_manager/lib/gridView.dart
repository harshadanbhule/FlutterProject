import 'package:flutter/material.dart';

class GridDemo extends StatefulWidget {
  const GridDemo({super.key});
  @override
  State createState() => _GridDemoState();
}

class _GridDemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 0,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, i) {
          return Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                25,
              ),
              color: Colors.lightBlueAccent,
            ),
            alignment: Alignment.center,
            // color: Colors.amber,
            child: Text("${i + 1}"),
          );
        },
      ),
    );
  }
}
