import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class BigCircle extends StatelessWidget {
  final bool? isRight, isColor;

  const BigCircle({super.key, this.isRight, this.isColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 12,
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: AppStyles.bgColor,
            borderRadius: isRight == true
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
      ),
    );
  }
}
