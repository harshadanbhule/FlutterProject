class ExpenseInfo {
  final String image;
  final String type;
  final String description;
  final int expense;
  final String date;

  const ExpenseInfo(
      {required this.image,
      required this.type,
      required this.description,
      required this.expense,
      required this.date});
}

List expenseModel = [
  const ExpenseInfo(
    image: "assets/medicine.png",
    type: "Medicine",
    description: "Lorem Ipsum is simply dummy text of the ",
    expense: 500,
    date: "3 June | 11:50 AM",
  ),
  const ExpenseInfo(
    image: "assets/food.png",
    type: "Food",
    description: "Lorem Ipsum is simply dummy text of the ",
    expense: 650,
    date: "3 June | 11:50 AM",
  ),
  const ExpenseInfo(
    image: "assets/shopping.png",
    type: "Shopping",
    description: "Lorem Ipsum is simply dummy text of the ",
    expense: 325,
    date: "3 June | 11:50 AM",
  ),
  const ExpenseInfo(
    image: "assets/fuel.png",
    type: "Fuel",
    description: "Lorem Ipsum is simply dummy text of the ",
    expense: 600,
    date: "3 June | 11:50 AM",
  ),
  const ExpenseInfo(
    image: "assets/entertainment.png",
    type: "Entertainment",
    description: "Lorem Ipsum is simply dummy text of the ",
    expense: 475,
    date: "3 June | 11:50 AM",
  ),
];

// Model Class For Drawer Button

class Drawercolor {
  final String buttonicon;
  final String buttonname;
  const Drawercolor({required this.buttonicon, required this.buttonname});
}

List drawerbutton = const [
  Drawercolor(buttonicon: "assets/t1.png", buttonname: "Transaction"),
  Drawercolor(buttonicon: "assets/graph.png", buttonname: "Graphs"),
  Drawercolor(buttonicon: "assets/category.png", buttonname: "Category "),
  Drawercolor(buttonicon: "assets/trash.png", buttonname: "Trash "),
  Drawercolor(buttonicon: "assets/aboutUs.png", buttonname: "About us"),
];

// girdview class

class GridViewDemo {
  final String buttonicon;
  final String buttonname;
  const GridViewDemo({required this.buttonicon, required this.buttonname});
}

List gridbutton =  const [
  GridViewDemo(buttonicon: "assets/food2.png", buttonname: "Food"),
  GridViewDemo(buttonicon: "assets/fuel2.png", buttonname: "Fuel"),
   GridViewDemo(buttonicon: "assets/medicine2.png", buttonname: "Medicine"),
  GridViewDemo(buttonicon: "assets/shopping2.png", buttonname: "Shopping"),

];
