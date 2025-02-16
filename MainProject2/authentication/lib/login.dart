    import "dart:developer";

    import "package:authentication/home.dart";
    import "package:authentication/signup.dart";
    import "package:authentication/snackbar.dart";

    import "package:firebase_auth/firebase_auth.dart";
    import "package:flutter/material.dart";
    import "package:google_fonts/google_fonts.dart";



    class LogIn extends StatefulWidget {
    const LogIn({super.key});

    @override
    State<LogIn> createState() => _LogInState();
    }

    class _LogInState extends State<LogIn> {
    final TextEditingController _emailTextEditingController =
        TextEditingController();
    final TextEditingController _passwordTextEditingController =
        TextEditingController();
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    bool isVisible = true;
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: AppBar(
        //   title: Text("Business.com",
        //       style: GoogleFonts.quicksand(
        //         textStyle: const TextStyle(
        //             fontSize: 28,
        //             fontWeight: FontWeight.w400,
        //             color: Colors.black),
        //       )),
        //   backgroundColor: Color.fromRGBO(32, 103, 234, 1),
        //   centerTitle: true,
        //   toolbarHeight: 80,
        // ),
        body: SingleChildScrollView(
            child: Stack(
            children: [
                Container(
                height: 390,
                width: 500,
                child: Image.asset(
                    "assets/images/Vector (4).png",
                    fit: BoxFit.cover,
                ),
                ),
                Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const SizedBox(
                        height: 160,
                    ),
                    Container(
                        height: 250,
                        width: 300,
                        child: Image.asset("assets/images/log_signin_bg.png"),
                    ),
                    const SizedBox(
                        height: 15,
                    ),
                    Text(
                        'Welcome back',
                        style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                    ),
                    Text(
                        'sign in to access your account',
                        style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
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
                        height: 22,
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
                            obscureText: isVisible, // Controls password visibility
                            decoration: InputDecoration(
                            fillColor: const Color.fromRGBO(170, 196, 243, 1),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                color: Colors.black,
                                width: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_clock_outlined),
                            suffixIcon: IconButton(
                                icon: Icon(
                                isVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                ),
                                onPressed: () {
                                setState(() {
                                    isVisible = !isVisible;
                                });
                                },
                            ),
                            )),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(
                            children: [
                            Checkbox(
                                value: false,
                                onChanged: (bool? newValue) {
                                // Handle remember me toggle
                                },
                            ),
                            const Text('Remember me'),
                            ],
                        ),
                        TextButton(
                            onPressed: () {
                            // Handle forgot password
                            },
                            child: const Text(
                            'Forget password?',
                            style: TextStyle(color: Colors.blue),
                            ),
                        ),
                        ],
                    ),
                    const SizedBox(height: 16),
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
                                UserCredential userCredential =
                                    await _firebaseAuth.signInWithEmailAndPassword(
                                        email: _emailTextEditingController.text,
                                        password:
                                            _passwordTextEditingController.text);
                                log(userCredential.user!.email!);
                                _emailTextEditingController.clear();
                                _passwordTextEditingController.clear();

                                Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home(),
                                ),
                                );
                            } on FirebaseAuthException catch (error) {
                                log("B2B: error code: ${error.code}");
                                log("B2B: error message: ${error.message}");
                                CustomSnackBar.showCustomSnackbar(
                                message: error.code,
                                // ignore: use_build_context_synchronously
                                context: context,
                                );
                            }
                            }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(32, 103, 234, 1),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            ),
                        ),
                        child: const Text('Login',
                            style: TextStyle(fontSize: 18, color: Colors.black)),
                        ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const Text('New Member? '),
                        GestureDetector(
                            onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                            },
                            child: const Text(
                            'Register now',
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
            ],
            ),
        ),
        );
    }
    }