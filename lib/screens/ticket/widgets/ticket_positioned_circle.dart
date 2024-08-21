import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class CirclePositioned extends StatelessWidget {
  final bool? isLeft;
  const CirclePositioned({super.key, this.isLeft});

  @override
  Widget build(BuildContext context) {
    return isLeft == true
        ? Positioned(
            left: 22,
            top: 251,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppStyles.textColor)),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: AppStyles.textColor,
              ),
            ))
        : Positioned(
            right: 22,
            top: 251,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: AppStyles.textColor)),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: AppStyles.textColor,
              ),
            ));
  }
}
