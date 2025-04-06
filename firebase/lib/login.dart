import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String mail = emailController.text.trim();
                String pass = passwordController.text.trim();

                if (mail.isEmpty || pass.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Enter all the fields")),
                  );
                } else {
                  try{
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail, password: pass).then((value){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successfully")));
                      Navigator.pushReplacementNamed(context, '/form');
                    });
                  }catch(err){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${err.toString()}")),
                    );
                  }
                }
              },
              child: const Text("Login"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Don't have an account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
