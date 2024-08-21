import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/utils/all_json.dart';
import 'package:book_me/screens/home/widgets/hotel_grid_view.dart';
import 'package:flutter/material.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Hotels'),
        centerTitle: true,
        backgroundColor: AppStyles.bgColor,
      ),
      backgroundColor: AppStyles.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.9),
            itemCount: hotelList.length,
            itemBuilder: (context, index) {
              var singleTicket = hotelList[index];
              return HotelGridView(hotel: singleTicket, index: index);
            }),
      ),
    );
  }
}
