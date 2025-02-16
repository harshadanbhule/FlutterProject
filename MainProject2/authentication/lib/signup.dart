import "dart:developer";
import "package:authentication/login.dart";
import "package:authentication/snackbar.dart";

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "package:google_fonts/google_fonts.dart";

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
              height: 390,
              width: 500,
              child: Image.asset("assets/images/Vector (4).png",
                  fit: BoxFit.cover)),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                      height: 250,
                      width: 300,
                      child: Image.asset(
                        "assets/images/log_signin_bg.png",
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Get Started',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    'by creating a free account',
                    style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      ),
                    ]),
                    child: TextField(
                      controller: _emailTextEditingController,
                      decoration: InputDecoration(
                        fillColor: const Color.fromRGBO(170, 196, 243, 1),
                        filled: true,
                        labelText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Phone number',
                        fillColor: const Color.fromRGBO(170, 196, 243, 1),
                        filled: true,
                        prefixIcon: const Icon(Icons.phone_android_outlined),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.black, width: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                    child: TextField(
                        controller: _passwordTextEditingController,
                        obscureText:
                            isVisiblePass, // Controls password visibility
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: const Color.fromRGBO(170, 196, 243, 1),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_clock_outlined),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisiblePass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisiblePass = !isVisiblePass;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(5, 8),
                      )
                    ]),
                    child: TextField(
                        obscureText:
                            isVisibleConfirmPass, // Controls password visibility
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          fillColor: Color.fromRGBO(170, 196, 243, 1),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_clock_outlined),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isVisibleConfirmPass
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                isVisibleConfirmPass = !isVisibleConfirmPass;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.black, width: 0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //const Spacer(),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 20,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_emailTextEditingController.text
                                .trim()
                                .isNotEmpty &&
                            _passwordTextEditingController.text
                                .trim()
                                .isNotEmpty) {
                          try {
                            UserCredential userCredential = await _firebaseAuth
                                .createUserWithEmailAndPassword(
                                    email:
                                        _emailTextEditingController.text.trim(),
                                    password: _passwordTextEditingController
                                        .text
                                        .trim());
                            log("User Credential : $userCredential");
                            CustomSnackBar.showCustomSnackbar(
                              message: "User Register Successfully",
                              context: context,
                            );
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LogIn()));
                          } on FirebaseAuthException catch (error) {
                            print("${error.code}");
                            print("${error.message}");
                            CustomSnackBar.showCustomSnackbar(
                              message: error.message!,
                              context: context,
                            );
                          }
                        } else {
                          CustomSnackBar.showCustomSnackbar(
                            message: "Please enter valid fields",
                            context: context,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(32, 103, 234, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Signup',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already a member? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()));
                          setState(() {});
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}