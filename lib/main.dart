import 'package:book_me/bloc/bottom_bloc/bottom_nav_bloc.dart';
import 'package:book_me/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:book_me/core/bottom_nav_bar.dart';
import 'package:book_me/core/utils/app_routes.dart';
import 'package:book_me/screens/home/all_hotels.dart';
import 'package:book_me/screens/home/all_tickets.dart';
import 'package:book_me/screens/home/hotel_detail.dart';
import 'package:book_me/screens/ticket/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavBloc()),
        BlocProvider(create: (_) => HotelBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        //home: const BottomNavBar(),
        //you can't use the homepage route and the home varialble together
        routes: {
          AppRoutes.homePage: (context) => BottomNavBar(),
          AppRoutes.allTickets: (context) => const AllTickets(),
          AppRoutes.ticketScreen: (context) => const TicketScreen(),
          AppRoutes.allHotels: (context) => const AllHotels(),
          AppRoutes.hotelDetail: (context) => const HotelDetail()
        },
      ),
    );
  }
}
