import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/utils/app_routes.dart';
import 'package:book_me/core/widgets/double_heading.dart';
import 'package:book_me/screens/search/widgets/app_test_icon.dart';
import 'package:book_me/screens/search/widgets/app_ticket_tabs.dart';
import 'package:book_me/screens/search/widgets/find_tickets.dart';
import 'package:book_me/screens/search/widgets/ticket_promotion.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: [
            const SizedBox(height: 40,),
            Text("What are\nyou looking for?", style: AppStyles.headlineStyle1.copyWith(fontSize: 35),),
            const SizedBox(height: 20,),
            const AppTicketTabs(
              tab1Text: 'All Tickets',tab2Text: 'Hotels',
            ),
            const SizedBox(height: 25,),
            const AppTextIcon(icon: Icons.flight_takeoff_rounded,text: "Departure",),
            const SizedBox(height: 20,),
            const AppTextIcon(icon: Icons.flight_land_rounded,text: "Arrival",),
            const SizedBox(height: 25,),
            const FindTickets(),
            const SizedBox(height: 40,),
            DoubleHeading(
              text1: 'Upcoming Flights',
              text2: 'View all',
              onTap:  () => Navigator.pushNamed(context, AppRoutes.allTickets),
            ),
            const SizedBox(height: 15,),
            const TicketPromotion(),
          ],
      ),
    );
  }
}
