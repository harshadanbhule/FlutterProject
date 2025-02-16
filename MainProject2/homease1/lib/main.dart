import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homease1/constatnts/theme.dart';
import 'package:homease1/home.dart';
import 'package:homease1/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homease1/provider/provider.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: "signapp",
      options: const FirebaseOptions(
         apiKey: "AIzaSyD6LatBhdfEmYF8BUOSMRV43RSyz0LcA4M",
          appId: "1:917877320917:android:5793b4c678ec55fdf9c65c",
          messagingSenderId: "917877320917",
          projectId: "majorproject-f4ca1"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'signPage',
        theme: AppTheme.theme,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapShot) {
              if (snapShot.data != null) {
                return const LoginScreen();
              }
              return const HomeScreen();
            }),
      ),
    );
  }
}