import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppLayouBuilder extends StatelessWidget {
  final int randomDivider;
  final double width;
  final bool? isColor;
  const AppLayouBuilder(
      {super.key, required this.randomDivider, this.width = 3, this.isColor});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // print("$constraints.constraintsWidth{}");
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List.generate(
            (constraints.constrainWidth() / randomDivider).floor(),
            (index) => SizedBox(
                  width: width,
                  height: 1,
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                    color: isColor == null
                        ? AppStyles.ticketWhite
                        : Colors.grey.shade300,
                  )),
                )),
      );
    });
  }
}
