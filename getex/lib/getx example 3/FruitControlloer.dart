import 'package:get/get.dart';

class Fruitcontrolloer extends GetxController{

  RxList<String> fruitList=["Banana","Apple","Orange","Mango"].obs;
  RxList tempFruitList=[].obs;

  addToFavourite(String value){
    tempFruitList.add(value);
  }

  removeToFavourite(String value){
    tempFruitList.remove(value);
  }

}