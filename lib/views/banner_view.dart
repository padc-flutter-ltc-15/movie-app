
import 'dart:ffi';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:themovieapp/network/api_constants.dart';
import '../data/vos/movie_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/gradient_view.dart';

class BannerSection extends StatefulWidget {

  final List<MovieVO>? movieList;

  const BannerSection({Key? key, required this.movieList}) : super(key: key);

  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {

  double _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3, //BANNER_SECTION_HEIGHT,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: widget.movieList?.map((item) => BannerView(
                url: "$IMAGE_BASE_URL${item.posterPath}",
                title: item.title??"")
            ).toList()??[],
          ),
        ),
      ],
    );
  }
}

class BannerView extends StatelessWidget {
  final String url;
  final String title;

  const BannerView({Key? key, required this.url, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( /// Container နဲ့ အရင်အုပ်မယ်
      child: Stack( /// Stack ထဲ ကို list အနေနဲ့ထည့်မယ် widgets
        children: [
          Positioned.fill(
            child: BannerImageView(url: url),
          ),
          Positioned.fill(
            child: GradientView(),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: BannerTitleView(title: title),
          ),
          Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.play_arrow,
              size: BANNER_PLAY_BUTTON_SIZE,
              color: PLAY_BUTTON_COLOR,
            ),
          )
        ],
      ),
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
    );
  }
}

class BannerTitleView extends StatelessWidget {
  const BannerTitleView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MARGIN_MEDIUM_2X),
      child: Column(
        mainAxisSize: MainAxisSize.min, /// Column တွင် row အတွက် alignment ဆိုရင် mainAxisSize
        crossAxisAlignment: CrossAxisAlignment.start, /// Column တွင် column အတွက် alignment ဆိုရင် crossAxisAlignment
        children: [
          Text(
      (title.length >= 16)? title.replaceRange(16, title.length, '...') : title,
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_HEADING_1X,
                fontWeight: FontWeight.w500,
              )
          ),
          Text(
            "Official Review",
            style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_HEADING_1X,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}