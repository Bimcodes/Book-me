import 'package:book_me/core/widgets/app_column_text_layout.dart';
import 'package:flutter/material.dart';

class TicketScreenDetails extends StatelessWidget {
  final String topText1, bottomText1, topText2, bottomText2;
  final bool? isColor;
  const TicketScreenDetails({
    super.key,
    required this.isColor,
    required this.bottomText1,
    required this.topText1,
    required this.topText2,
    required this.bottomText2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppColumnTextLayout(
          topText: topText1,
          bottomText: bottomText1,
          alignment: CrossAxisAlignment.start,
          isColor: isColor,
        ),
        AppColumnTextLayout(
          topText: topText2,
          bottomText: bottomText2,
          alignment: CrossAxisAlignment.end,
          isColor: isColor,
        )
      ],
    );
  }
}
