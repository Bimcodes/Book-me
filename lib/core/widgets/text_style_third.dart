import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class TextStyleThird extends StatelessWidget {
  final String text;
  final bool? isColor;
  const TextStyleThird({super.key, required this.text, this.isColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: isColor==null? AppStyles.headlineStyle3
          .copyWith(color: Colors.white):AppStyles.headlineStyle3,
    );
  }
}
