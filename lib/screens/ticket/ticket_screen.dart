import 'package:barcode_widget/barcode_widget.dart';
import 'package:book_me/core/res/media.dart';
import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/utils/all_json.dart';
import 'package:book_me/core/widgets/app_column_text_layout.dart';
import 'package:book_me/core/widgets/app_layout_builder.dart';
import 'package:book_me/core/widgets/ticket_view.dart';
import 'package:book_me/screens/search/widgets/app_ticket_tabs.dart';
import 'package:book_me/screens/ticket/widgets/ticket_positioned_circle.dart';
import 'package:book_me/screens/ticket/widgets/ticket_screen_details.dart';
import 'package:flutter/material.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  // this method here is to access arguments passed from another screen into a new screen

  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      ticketIndex = args["index"];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        appBar: AppBar(
          title: Text(
            'Tickets',
            style: AppStyles.headlineStyle2,
          ),
          centerTitle: true,
          backgroundColor: AppStyles.bgColor,
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                // const SizedBox(height: 40),
                // Text('Tickets', style: AppStyles.headlineStyle1),
                // const SizedBox(height: 20),
                const AppTicketTabs(tab1Text: 'Upcoming', tab2Text: 'Previous'),
                const SizedBox(height: 20),
                Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.only(left: 16),
                    child: TicketView(
                        ticket: ticketList[ticketIndex], isColor: true)),
                const SizedBox(
                  height: 1,
                ),
                Container(
                    // the margin is used to create space outside the container while the padding is used to create space inside the container
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    color: AppStyles.ticketWhite,
                    child: Column(
                      children: [
                        const TicketScreenDetails(
                            isColor: true,
                            bottomText1: 'Passenger',
                            topText1: 'Flutter DB',
                            topText2: '5221 36869',
                            bottomText2: 'passport'),
                        const SizedBox(height: 20),
                        const AppLayouBuilder(
                            randomDivider: 10, width: 5, isColor: false),
                        const SizedBox(height: 20),
                        const TicketScreenDetails(
                            isColor: true,
                            topText1: '246506584940',
                            bottomText1: 'Number of E-ticket',
                            topText2: 'B46859',
                            bottomText2: 'Booking code'),
                        const SizedBox(
                          height: 20,
                        ),
                        const AppLayouBuilder(
                            randomDivider: 10, width: 5, isColor: false),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(AppMedia.visaCard, scale: 8),
                                    Text(' **** 2462',
                                        style: AppStyles.headlineStyle3)
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Text('Payment method',
                                    style: AppStyles.headlineStyle4)
                              ],
                            ),
                            const AppColumnTextLayout(
                                topText: '\$299.99',
                                bottomText: 'Price',
                                alignment: CrossAxisAlignment.end,
                                isColor: true)
                          ],
                        ),
                      ],
                    )),
                const SizedBox(height: 1),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppStyles.ticketWhite,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(21),
                      bottomRight: Radius.circular(21),
                    ),
                  ),
                  child: Container(
                    //color: Colors.blue,
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(50),
                    //     color: Colors.blue),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(21),
                      child: BarcodeWidget(
                        //color: Colors.red,
                        height: 70,
                        drawText: false,
                        data: 'https://www.dbestech.com',
                        barcode: Barcode.code128(),
                        color: AppStyles.textColor,
                        width: double.infinity,
                        // decoration:
                        //     BoxDecoration(borderRadius: BorderRadius.circular(21)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex]),
                )
              ],
            ),
            const CirclePositioned(isLeft: true),
            const CirclePositioned(isLeft: false)
          ],
        ));
  }
}
