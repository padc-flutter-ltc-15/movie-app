
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/dimens.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: MARGIN_MEDIUM_2X,
      initialRating: 5.0,
      itemBuilder: (BuildContext context, int index) {
        return const Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
