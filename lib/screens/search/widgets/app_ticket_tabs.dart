import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppTicketTabs extends StatelessWidget {
  final String tab1Text, tab2Text;
  const AppTicketTabs({super.key, required this.tab1Text, required this.tab2Text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: AppStyles.ticketTabColor),
      child:  Row(children: [
        AppTabs(
          tabText: tab1Text,
        ),
        AppTabs(
          tabText: tab2Text,
          tabBorder: true,
          tabColor: true,
        )
      ]),
    );
  }
}

class AppTabs extends StatelessWidget {
  const AppTabs(
      {super.key,
      this.tabText = "",
      this.tabBorder = false,
      this.tabColor = false});

  final String tabText;
  final bool tabBorder;
  final bool tabColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      width: size.width * .44,
      decoration: BoxDecoration(
          color: tabColor == false ? Colors.white : Colors.transparent,
          borderRadius: tabBorder == false
              ? const BorderRadius.horizontal(left: Radius.circular(50))
              : const BorderRadius.horizontal(right: Radius.circular(50))),
      child: Center(child: Text(tabText)),
    );
  }
}
