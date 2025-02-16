import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});
  @override
  State createState() => _SplashState();
}

class _SplashState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: const Color.fromRGBO(251, 247, 248, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: GestureDetector(
              onTap: () {
                // Within the `FirstRoute` widget

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              child: Container(
                height: 144,
                width: 144,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(234, 238, 235, 1),
                ),
                child: Image.asset("assets/money.png"),
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            child: Text(
              "Expense Manager",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
