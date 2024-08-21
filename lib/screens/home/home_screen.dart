// ignore_for_file: file_names

import 'package:book_me/core/widgets/heading_text.dart';
import 'package:book_me/screens/home/widgets/hotel.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

import 'package:book_me/core/res/media.dart';
import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/utils/all_json.dart';
import 'package:book_me/core/utils/app_routes.dart';
import 'package:book_me/core/widgets/double_heading.dart';
import 'package:book_me/core/widgets/ticket_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 40),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good morning', style: AppStyles.headlineStyle3),
                          const HeadingText(
                            text: "Book Tickets",
                          ),
                        ]),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(AppMedia.logo))),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF4F6FD),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(children: [
                    const Icon(
                      FluentSystemIcons.ic_fluent_search_regular,
                      color: Color(0xFFFBFC20),
                    ),
                    Text(
                      'Search',
                      style: AppStyles.headlineStyle3
                          .copyWith(fontWeight: FontWeight.w400),
                    )
                  ]),
                ),
                const SizedBox(height: 20),
                DoubleHeading(
                  text1: "Upcoming Flights",
                  text2: 'View all',
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.allTickets),
                ),
                const SizedBox(height: 25),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ticketList
                          .take(2)
                          .map((singleTicket) => GestureDetector(
                                onTap: () {
                                  var index = ticketList.indexOf(singleTicket);
                                  Navigator.pushNamed(
                                      context, AppRoutes.ticketScreen,
                                      arguments: {"index": index});
                                },
                                child: TicketView(
                                  ticket: singleTicket,
                                ),
                              ))
                          .toList(),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            DoubleHeading(
              text1: 'Hotels',
              text2: 'View all',
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.allHotels);
              },
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: hotelList
                      .take(2)
                      .map((singleHotel) => GestureDetector(
                          onTap: () {
                            var index = hotelList.indexOf(singleHotel);
                            Navigator.pushNamed(context, AppRoutes.hotelDetail,
                                arguments: {"index": index});
                          },
                          child: Hotel(hotel: singleHotel)))
                      .toList(),
                )),
            const SizedBox(height: 40)
          ]),
    );
  }
}

