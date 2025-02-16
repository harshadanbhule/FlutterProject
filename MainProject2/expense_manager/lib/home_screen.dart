import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:google_fonts/google_fonts.dart';
import 'modelclass.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  //Variable and method for drawer color
  Color drawerbuttoncolor = Colors.white;
  int _drawercolor = -1;
  void changedrawerbuttoncolor(int i) {
    _drawercolor = i;
  }

  // Method For Drawer
  Drawer drawermethod() {
    return Drawer(
      width: 216,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 35, left: 25),
            child: Text(
              "Expense manager",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 25),
            child: Text(
              "Saves all your Transactions",
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: drawerbutton.length,
              itemBuilder: (context, int i) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      changedrawerbuttoncolor(i);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 40),
                    height: 40,
                    width: 14,
                    decoration: BoxDecoration(
                      color: _drawercolor != i
                          ? Colors.white
                          : const Color.fromRGBO(14, 161, 125, 0.15),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: _drawercolor != i
                                ? Colors.white
                                : const Color.fromRGBO(14, 161, 125, 0.15),
                            blurRadius: 1),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 12, right: 12),
                          child: Image.asset(drawerbutton[i].buttonicon),
                        ),
                        Text(
                          drawerbutton[i].buttonname,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _drawercolor != i
                                ? Colors.black
                                : const Color.fromRGBO(14, 161, 125, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        // leading: const Icon(Icons.menu_outlined),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.search_outlined,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: expenseModel.length + 1,
        itemBuilder: (context, int i) {
          return i != expenseModel.length
              ? Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 22),
                        height: 41,
                        width: 41,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(expenseModel[i].image),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  expenseModel[i].type,
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  child: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.red,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 8,
                                  ),
                                  child: Text(
                                    "${expenseModel[i].expense}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  expenseModel[i].description,
                                  style: GoogleFonts.poppins(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  expenseModel[i].date,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container();
        },
        separatorBuilder: (context, index) {
          return const Text(
            "     ------------------------------------------------------------------------------------------   ",
            style: TextStyle(
              color: Color.fromRGBO(206, 206, 206, 1),
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
                "Add Transaction ",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer:drawermethod(),
    );
  }
}
