import 'package:book_me/core/res/media.dart';
import 'package:book_me/core/res/styles/app_styles.dart';
import 'package:book_me/core/widgets/heading_text.dart';
import 'package:book_me/core/widgets/text_style_fourth.dart';
import 'package:book_me/core/widgets/text_style_third.dart';
import 'package:book_me/screens/profile/widget/row_profile_description.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(height: 40),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:
                      const DecorationImage(image: AssetImage(AppMedia.logo))),
            ),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const HeadingText(text: 'Book Tickets'),
              Text('New-York',
                  style: AppStyles.headlineStyle5
                      .copyWith(color: Colors.grey.shade500)),
              const SizedBox(height: 8),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppStyles.containerPink),
                  child: Row(children: [
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppStyles.profileBlue),
                        child: const Icon(
                            FluentSystemIcons.ic_fluent_shield_filled,
                            color: Colors.white,
                            size: 15)),
                    const SizedBox(width: 5),
                    Text('Premium status',
                        style: AppStyles.headlineStyle5
                            .copyWith(color: AppStyles.profileBlue))
                  ]))
            ]),
            Expanded(child: Container()),
            Text('Edit',
                style: AppStyles.headlineStyle3.copyWith(
                    color: AppStyles.primaryColor, fontWeight: FontWeight.w300))
          ]),
          const SizedBox(height: 10),
          Divider(color: AppStyles.grey, thickness: 2),
          Stack(children: [
            Container(
                height: 90,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppStyles.primaryColor)),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Row(children: [
                  CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(
                          FluentSystemIcons.ic_fluent_lightbulb_filament_filled,
                          color: AppStyles.primaryColor,
                          size: 27)),
                  const SizedBox(width: 10),
                  const Column(children: [
                    TextStyleThird(text: "You've got a new award"),
                    TextStyleFourth(text: "You have 95 flights this year")
                  ])
                ])),
            Positioned(
                right: -45,
                bottom: 40,
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 18, color: const Color(0XFF264CD2))),
                ))
          ]),
          const SizedBox(height: 20),
          const HeadingText(text: 'Acummulated Miles'),
          const SizedBox(height: 10),
          const Center(
              child: Text('192802',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('Miles accured',
                style: AppStyles.headlineStyle4
                    .copyWith(color: AppStyles.grey2, fontSize: 17)),
            Text('16th July',
                style: AppStyles.headlineStyle4
                    .copyWith(color: AppStyles.grey2, fontSize: 17))
          ]),
          Divider(color: AppStyles.grey, thickness: 2),
          const RowProfileDescription(
              text1: '23 042',
              text2: "Miles",
              text3: "Airline CO",
              text4: "Recieved from"),
          const SizedBox(height: 10),
          const RowProfileDescription(
              text1: '24',
              text2: "Miles",
              text3: "MacDonald's",
              text4: "Recieved from"),
          const SizedBox(height: 10),
          const RowProfileDescription(
              text1: '53 340',
              text2: "Miles",
              text3: "DBestech",
              text4: "Recieved from"),
          const SizedBox(height: 25),
          GestureDetector(
            child: Center(
              child: Text("How to get more miles",
                  style: AppStyles.textStyle
                      .copyWith(color: AppStyles.primaryColor)),
            ),
          )
        ],
      ),
    );
  }
}
