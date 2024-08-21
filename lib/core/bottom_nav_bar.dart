//import 'package:book_me/provider/bottom_nav_bar_provider.dart';
import 'package:book_me/bloc/bottom_bloc/bottom_nav_bloc.dart';
import 'package:book_me/bloc/bottom_bloc/bottom_nav_events.dart';
import 'package:book_me/bloc/bottom_bloc/bottom_nav_states.dart';
import 'package:book_me/screens/home/home_Screen.dart';
import 'package:book_me/screens/profile/profile_screen.dart';
import 'package:book_me/screens/search/search_screen.dart';
import 'package:book_me/screens/ticket/ticket_screen.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final appScreens = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen()
  ];

  // int _selectedIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context
      // this is for when you want to use riverpod with a consumer widget
      //WidgetRef ref
      ) {
    //var selectedIndex = ref.watch(bottomNavBarNotifierProvider);
    return BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
      var selectedIndex = (state as BottomNavBarSelected).selectedIndex;
      return Scaffold(
        body: appScreens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (int index) =>
                context.read<BottomNavBloc>().add(OnItemTapped(index)),
            //onTap: ref.watch(bottomNavBarNotifierProvider.notifier).onItemTapped, -> this is for when using riverpod, to access a funtion
            selectedItemColor: Colors.blueGrey,
            unselectedItemColor: const Color(0xFF526400),
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_home_add_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
                  label: "search"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
                  label: "Tickets"),
              BottomNavigationBarItem(
                  icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
                  activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
                  label: "Person"),
            ]),
      );
    });
  }
}
