import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class DoubleHeading extends StatelessWidget {
  final String text1, text2;
  final void Function() onTap;
  const DoubleHeading(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1, style: AppStyles.headlineStyle2),
        InkWell(
          onTap: onTap,
          child: Text(text2, style: AppStyles.textStyle.copyWith(color:AppStyles.primaryColor )),
        ),
      ],
    );
  }
}
