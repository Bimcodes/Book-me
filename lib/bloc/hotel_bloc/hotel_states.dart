abstract class HotelState {}

class TextExpansionToggled extends HotelState {
  final bool isToggled;
  TextExpansionToggled(this.isToggled);
}
