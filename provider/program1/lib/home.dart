import 'package:flutter/material.dart';
import 'package:program1/countProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(child: Column(
        children: [
       Consumer<Countprovider>(builder: (ctx,_,__){
        /*here we create consumer because we dont want to call
         every time to build(context) to build page using cosumer we call 
         new context that we denoted as ctx which build page every time when change value of count
        */
        print("ctx printed");
        return Text(
           // "Count : ${Provider.of<Countprovider>(ctx,listen:true).getCount()}"
           "Count : ${ctx.read<Countprovider>().getCount()}"
          );
       }) ,  
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: (){
            //Provider.of<Countprovider>(context,listen:false).decrement();
            
            context.watch<Countprovider>().decrement();
          }, child: const Text("Decrement")),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          //Provider.of<Countprovider>(context,listen:false).increment();
          context.watch<Countprovider>().increment();

      }),
    );
  }
}