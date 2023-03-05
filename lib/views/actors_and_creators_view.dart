
import 'package:flutter/material.dart';
import 'package:themovieapp/network/api_constants.dart';
import 'package:themovieapp/resources/strings.dart';

import '../data/vos/actor_vo.dart';
import '../resources/dimens.dart';
import '../widgets/title_text_with_see_more.dart';

class ActorsAndCreatorsSection extends StatelessWidget {

  final String title;
  final String seeMore;
  final bool seeMoreVisibility;
  final List<ActorVO> actorList;

  const ActorsAndCreatorsSection({
    Key? key, required this.title, required this.seeMore, this.seeMoreVisibility = true, required this.actorList,
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
          child: ListView.builder( /// ListView
            scrollDirection: Axis.horizontal,
            itemCount: actorList.length,
            itemBuilder: (BuildContext context, int index) {
              return ActorViewItem(
                actor: actorList[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class ActorViewItem extends StatelessWidget {

  final ActorVO actor;

  const ActorViewItem({
    Key? key, required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MOVIE_LIST_ITEM_WIDTH,
      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Stack(
        children: [
          Positioned.fill(
            child: ActorImageView(actor: actor,),
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
              child: ActorNameAndLike(actor: actor,),
            ),
          )
        ],
      ),
    );
  }
}

class ActorImageView extends StatelessWidget {

  final ActorVO actor;

  const ActorImageView({
    Key? key, required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "$IMAGE_BASE_URL${actor.profilePath}",
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
  final ActorVO actor;

  const ActorNameAndLike({
    Key? key, required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min, /// stick to bottom
      children: [
        Text(
          actor.name,
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