
import 'package:flutter/material.dart';
import 'package:themovieapp/resources/strings.dart';

import '../resources/dimens.dart';
import '../widgets/title_text_with_see_more.dart';

class ActorsAndCreatorsSection extends StatelessWidget {

  final String title;
  final String seeMore;
  final bool seeMoreVisibility;

  const ActorsAndCreatorsSection({
    Key? key, required this.title, required this.seeMore, this.seeMoreVisibility = true,
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
            title: title,
            seeMore: seeMore,
            seeMoreVisibility: seeMoreVisibility,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM_2X,
        ),
        Container(
          height: ACTOR_LIST_HEIGH,
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2X),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ActorViewItem(),
              ActorViewItem(),
              ActorViewItem(),
            ],
          ),
        )
      ],
    );
  }
}

class ActorViewItem extends StatelessWidget {
  const ActorViewItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIE_LIST_ITEM_WIDTH,
      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LikeButtonView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM),
              child: ActorNameAndLike(),
            ),
          )
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {
  const ActorImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://cdn.i-scmp.com/sites/default/files/d8/images/canvas/2022/01/07/640ae4c6-a328-4104-8dc4-5287d8bccae1_109a9bae.jpg",
      fit: BoxFit.cover,
    );
  }
}

class LikeButtonView extends StatelessWidget {
  const LikeButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite_border,
      color: Colors.amber,
      size: MARGIN_MEDIUM_2X,
    );
  }
}

class ActorNameAndLike extends StatelessWidget {
  const ActorNameAndLike({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, /// stick to bottom
      children: [
        Text(
          "Keanu Reeves",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        Row(
          children: [
            Icon(
              Icons.thumb_up,
              color: Colors.amber,
              size: MARGIN_MEDIUM_2X,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "You like 18 movies.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_TINY,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}