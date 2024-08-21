import 'package:book_me/bloc/hotel_bloc/hotel_bloc.dart';
import 'package:book_me/bloc/hotel_bloc/hotel_event.dart';
import 'package:book_me/bloc/hotel_bloc/hotel_states.dart';
import 'package:book_me/core/res/styles/app_styles.dart';
// import 'package:book_me/provider/text_expansion_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpandedTextWidget extends StatelessWidget {
  final String text;

  const ExpandedTextWidget({super.key, required this.text});

  // bool isExpanded = false;
  // _toggleExpansion() {
  //   setState(() {
  //     isExpanded = !isExpanded;
  //   });
  // }

  @override
  Widget build(BuildContext context
      //WidgetRef ref
      ) {
    // var provider = ref.watch(textExpansionNotifierProvider);

    return BlocBuilder<HotelBloc, HotelState>(builder: (context, state) {
      var isExpanded = (state as TextExpansionToggled).isToggled;
      var textWidget = Text(
        text,
        overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        maxLines: isExpanded ? null : 6,
        style: AppStyles.headlineStyle3.copyWith(fontWeight: FontWeight.w400),
      );
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textWidget,
          GestureDetector(
            onTap: () =>
                context.read<HotelBloc>().add(ToggleTextExpansion(isExpanded)),
            // ref
            //     .watch(textExpansionNotifierProvider.notifier)
            //     .isExpanded(provider),
            child: Text(isExpanded ? 'less' : 'more',
                style: AppStyles.textStyle
                    .copyWith(color: AppStyles.primaryColor)),
          )
        ],
      );
    });
  }
}
