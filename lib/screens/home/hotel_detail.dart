import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/utils/all_json.dart';
import 'package:book_me/screens/home/widgets/expanded_text_widget.dart';
import 'package:flutter/material.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int hotelIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
        hotelIndex = args["index"];
      
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppStyles.primaryColor),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
                background: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/${hotelList[hotelIndex]["image"]}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      color: Colors.black.withOpacity(0.3),
                      child: Text(
                        hotelList[hotelIndex]["place"],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            shadows: [
                              Shadow(
                                  blurRadius: 10.0,
                                  color: AppStyles.primaryColor,
                                  offset: const Offset(2.0, 2.0))
                            ]),
                      )),
                )
              ],
            )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpandedTextWidget(text: hotelList[hotelIndex]["detail"]),
                    const SizedBox(height: 20),
                    const Text('More images',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hotelList[hotelIndex]["images"].length,
                        itemBuilder: (context, imageIndex) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            child: Image.asset(
                                'assets/images/${hotelList[hotelIndex]["images"][imageIndex]}'),
                          );
                        },
                      ),
                    )
                  ],
                ))
          ]))
        ],
      ),
    );
  }
}
