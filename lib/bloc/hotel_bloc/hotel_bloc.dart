import 'package:bloc/bloc.dart';
import 'package:book_me/bloc/hotel_bloc/hotel_event.dart';
import 'package:book_me/bloc/hotel_bloc/hotel_states.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(TextExpansionToggled(false)) {
    on<ToggleTextExpansion>((event, emit) {
      emit(TextExpansionToggled(!event.isToggled));
    });
  }
}
