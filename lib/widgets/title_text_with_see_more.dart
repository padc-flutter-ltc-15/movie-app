
import 'package:flutter/material.dart';
import 'package:themovieapp/widgets/see_more_text.dart';
import 'package:themovieapp/widgets/title_text.dart';

class TitleTextWithSeeMore extends StatelessWidget {

  final String title;
  final String seeMore;
  final bool seeMoreVisibility;

  const TitleTextWithSeeMore({
    Key? key, required this.title, required this.seeMore, this.seeMoreVisibility = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          TitleText(
            title: title,
          ),
          Spacer(),
          Visibility(
            visible: seeMoreVisibility,
            child: SeeMoreText(
              title: seeMore,
            ),
          )
        ]
    );
  }
}