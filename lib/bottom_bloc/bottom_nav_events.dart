import 'package:flutter/foundation.dart';

abstract class BottomNavBarEvent {}

class OnItemTapped extends BottomNavBarEvent {
  final int index;
  OnItemTapped(this.index) {
    if (kDebugMode) {
      print("my index is $index");
    }
  }
}
