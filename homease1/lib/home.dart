import 'package:flutter/material.dart';
import 'package:homease1/model/auth_model.dart';
import 'package:homease1/provider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final userProvider =
        Provider.of<UserProvider>(context, listen: false).getUserData();

    return FutureBuilder<AuthModel>(
        future: userProvider,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "hello"
        ),
      ),
      body: Center(
        child: Column(
          children: [
             Text(snapshot.data!.email),
                  Text(snapshot.data!.name),
                  Text(snapshot.data!.id)
          ],
        ),
      ),
      );
         } );
  }
}