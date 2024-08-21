import 'package:flutter/foundation.dart';

abstract class HotelEvent {}

class ToggleTextExpansion extends HotelEvent {
  bool isToggled;
  ToggleTextExpansion(this.isToggled) {
    if (kDebugMode) {
      print("My istoggled is $isToggled");
    }
    isToggled = !isToggled;
  }
}
