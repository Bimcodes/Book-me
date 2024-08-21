import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/widgets/spacer.dart';
import 'package:flutter/material.dart';

class TicketDetails extends StatelessWidget {
  final String text1, text3;
  final bool? isColor;
  const TicketDetails(
      {super.key,
      required this.text1,
      //required this.text2,
      required this.text3,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            text1,
            style: colorCondition(),
          ),
        ),
        const Space(),
        
        SizedBox(
          width: 100,
          child: Text(
            text3,
            textAlign: TextAlign.end,
            style: colorCondition(),
          ),
        ),
      ],
    );
  }

  TextStyle colorCondition() => isColor == null
      ? AppStyles.headlineStyle4.copyWith(color: Colors.white)
      : AppStyles.headlineStyle4;
}
