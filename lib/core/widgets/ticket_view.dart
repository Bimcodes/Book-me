import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/widgets/app_layout_builder.dart';
import 'package:book_me/core/widgets/big_circle.dart';
import 'package:book_me/core/widgets/big_dot.dart';
import 'package:book_me/core/widgets/spacer.dart';
import 'package:book_me/core/widgets/tickets_details.dart';
import 'package:flutter/material.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView(
      {super.key,
      required this.ticket,
      this.wholeScreen = false,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 174,
      child: Container(
        //color: Colors.blue,
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            //blue part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketBlue
                      : AppStyles.ticketWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(21),
                      topRight: Radius.circular(21))),
              child: Column(children: [
                //Card for showing departure and destination(blue and orange) this uses icon
                Row(
                  children: [
                    Text(
                      ticket['from']['code'],
                      style: isColor == null
                          ? AppStyles.headlineStyle3
                              .copyWith(color: AppStyles.ticketWhite)
                          : AppStyles.headlineStyle3,
                    ),
                    const Space(),
                    BigDot(
                      isColor: isColor,
                    ),
                    Expanded(
                        child: Stack(
                      children: [
                        SizedBox(
                          height: 24,
                          child: AppLayouBuilder(
                            randomDivider: 6,
                            isColor: isColor,
                          ),
                        ),
                        Center(
                          child: Transform.rotate(
                            angle: 1.6,
                            child: Icon(
                              Icons.local_airport_rounded,
                              color: isColor == null
                                  ? AppStyles.ticketWhite
                                  : AppStyles.planeSecondColor,
                            ),
                          ),
                        )
                      ],
                    )),
                    BigDot(
                      isColor: isColor,
                    ),
                    const Space(),
                    Text(
                      ticket['to']['code'],
                      style: isColor == null
                          ? AppStyles.headlineStyle3
                              .copyWith(color: AppStyles.ticketWhite)
                          : AppStyles.headlineStyle3,
                    ),
                  ],
                ),
                //Card for showing departure and destination(blue and orange) this uses only text
                const SizedBox(
                  height: 3,
                ),
                TicketsRowDetails(
                  text1: ticket['from']['name'],
                  text2: ticket['flying_time'],
                  text3: ticket['to']['name'],
                  isColor: isColor,
                )
              ]),
            ),
            //circles and dots
            Container(
              color: isColor == null
                  ? AppStyles.ticketOrange
                  : AppStyles.ticketWhite,
              child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigCircle(
                      isRight: false,
                      isColor: isColor,
                    ),
                    Expanded(
                        child: AppLayouBuilder(
                      randomDivider: 12,
                      width: 6,
                      isColor: isColor,
                    )),
                    BigCircle(
                      isRight: true,
                      isColor: isColor,
                    ),
                  ]),
            ),
            //orange part of the ticket
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null
                      ? AppStyles.ticketOrange
                      : AppStyles.ticketWhite,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                      bottomRight: Radius.circular(isColor == null ? 21 : 0))),
              child: Column(children: [
                //Card for showing departure and destination(blue and orange) this uses icon
                TicketsRowDetails(
                  text1: ticket['date'],
                  text2: ticket['departure_time'],
                  text3: ticket['number'].toString(),
                  isColor: isColor,
                ),
                //Card for showing departure and destination(blue and orange) this uses only text
                const SizedBox(
                  height: 3,
                ),
                TicketsRowDetails(
                  text1: 'Date',
                  text2: 'Departure time',
                  text3: 'Number',
                  isColor: isColor,
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
