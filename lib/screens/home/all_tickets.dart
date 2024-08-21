import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/utils/all_json.dart';
import 'package:book_me/core/utils/app_routes.dart';
import 'package:book_me/core/widgets/ticket_view.dart';
import 'package:flutter/material.dart';

class AllTickets extends StatelessWidget {
  const AllTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text(
          'All Tickets',
          style: AppStyles.headlineStyle3,
        ),
        centerTitle: true,
        backgroundColor: AppStyles.bgColor,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: ticketList
                  .map((singleTicket) => GestureDetector(
                        onTap: () {
                          var index = ticketList.indexOf(singleTicket);
                          Navigator.pushNamed(context, AppRoutes.ticketScreen,
                              arguments: {'index': index});
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: TicketView(
                            ticket: singleTicket,
                            wholeScreen: true,
                            //isColor: true,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
