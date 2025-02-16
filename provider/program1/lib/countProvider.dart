
import 'package:flutter/material.dart';

class Countprovider extends ChangeNotifier {
  int _count =0;

  int getCount()=>_count;

  void increment(){
    _count++;
    notifyListeners();
  }

  void decrement(){
    if(_count>0){
      _count--;
      notifyListeners();
    }
  }
}

