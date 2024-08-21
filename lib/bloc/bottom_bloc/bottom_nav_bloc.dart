import 'package:book_me/bloc/bottom_bloc/bottom_nav_events.dart';
import 'package:bloc/bloc.dart';
import 'package:book_me/bloc/bottom_bloc/bottom_nav_states.dart';

class BottomNavBloc extends Bloc<BottomNavBarEvent,BottomNavState>{

  BottomNavBloc():super(BottomNavBarSelected(0)){
    on<OnItemTapped>((event, emit){
      emit(BottomNavBarSelected(event.index));
    });
  }
}
