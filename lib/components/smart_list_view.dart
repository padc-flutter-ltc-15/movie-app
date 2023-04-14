
import 'package:flutter/cupertino.dart';

import '../resources/dimens.dart';

class SmartListView extends StatefulWidget {

  final double heigh;
  final double padding;
  final int itemsLength;
  final IndexedWidgetBuilder itemBuilder;
  final Function onListEndReached;

  const SmartListView({Key? key, required this.itemsLength, required this.itemBuilder, required this.heigh, required this.padding, required this.onListEndReached}) : super(key: key);

  @override
  State<SmartListView> createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {

  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if(_scrollController.position.atEdge) {
        if(_scrollController.position.pixels == 0) {
          print("Start of the list reached!");
        } else {
          print("End of the list reached!");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heigh,
      padding: EdgeInsets.only(left: widget.padding),
      child: ListView.builder( /// ListView
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemsLength,
        itemBuilder: widget.itemBuilder,
        controller: _scrollController,
      ),
    );
  }
}
