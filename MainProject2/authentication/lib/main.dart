
import 'package:authentication/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAMiuj6KVpBVTFTZz-UpOTgxkDUhSBhRPs',
      appId: '1:409091455657:android:f795e370c119bdac69c7b8',
      messagingSenderId: '409091455657',
      projectId: 'flutterauth-72c9e',
    ),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}