import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class TitleText extends StatelessWidget {
  final String title;

  const TitleText({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: HOME_SCREEN_LIST_TITLE_COLOR,
        fontSize: TEXT_REGULAR,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}