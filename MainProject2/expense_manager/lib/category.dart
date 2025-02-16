import 'package:expense_manager/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({super.key});
  @override
  State createState() => _CategoreyState();
}

class _CategoreyState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: gridbutton.length,
        itemBuilder: (context, i) {
          return Container(
            height: 150,
            width: 145,
            margin:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 2),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.15),
                    blurRadius: 8,
                    offset: Offset(1, 2)),
              ],
              borderRadius: BorderRadius.circular(
                45,
              ),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Image.asset(
                  "${gridbutton[i].buttonicon}",
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    gridbutton[i].buttonname,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 30),
        height: 46,
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: Colors.red,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(67),
          ),
          backgroundColor: Colors.white,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5, right: 8),
                child: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.green,
                  size: 35,
                ),
              ),
              Text(
                "Add Category ",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
