
import 'package:flutter/material.dart';
import 'package:themovieapp/resources/strings.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/title_text.dart';
import '../widgets/title_text_with_see_more.dart';

class ShowCasesSection extends StatelessWidget {
  const ShowCasesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2X
          ),
          child: TitleTextWithSeeMore(
            title: MAIN_SCREEN_SHOW_CASES,
            seeMore: MAIN_SCREEN_SEE_MORE_SHOW_CASES,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        Container(
          height: MOVIE_LIST_HEIGH,
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2X),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ShowCaseView(),
              ShowCaseView(),
              ShowCaseView(),
            ],
          ),
        )
      ],
    );
  }
}

class ShowCaseView extends StatelessWidget {
  const ShowCaseView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SHOW_CASE_ITEM_WIDTH,
      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              "https://www.koimoi.com/wp-content/new-galleries/2022/10/deadpool-4-has-allegedly-already-been-greenlit-by-marvel-001.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_arrow,
              size: BANNER_PLAY_BUTTON_SIZE,
              color: PLAY_BUTTON_COLOR,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_2X),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, /// stick to bottom
                children: [
                  Text(
                    "Deadpool",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_3X,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: MARGIN_SMALL,
                  ),
                  TitleText(title: "Dec 15, 2023")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}