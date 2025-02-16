
import 'package:get/get.dart';

class Counter extends GetxController{

  RxInt count=1.obs;

  incrementCounter(){
    count.value++;
    print(count.value);
  }
}