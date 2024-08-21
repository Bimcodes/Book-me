import 'package:book_me/core/widgets/app_column_text_layout.dart';
import 'package:flutter/material.dart';

class RowProfileDescription extends StatelessWidget {
  final String text1, text2, text3, text4;
  const RowProfileDescription(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppColumnTextLayout(
            topText: text1,
            bottomText: text2,
            alignment: CrossAxisAlignment.start,
            isColor: true),
        AppColumnTextLayout(
            topText: text3,
            bottomText: text4,
            alignment: CrossAxisAlignment.end,
            isColor: true),
      ],
    );
  }
}
