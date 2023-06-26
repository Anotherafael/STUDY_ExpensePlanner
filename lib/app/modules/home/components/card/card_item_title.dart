import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../theme/app_typography.dart';

class CardItemTitleWidget extends StatelessWidget {
  final String title;
  final DateTime date;

  const CardItemTitleWidget({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          titleComponent(title),
          dateComponent(date),
        ],
      ),
    );
  }

  Widget titleComponent(String title) {
    return FittedBox(
      child: Text(
        title,
        style: AppTypographies.cardTitleTextStyle,
      ),
    );
  }

  Widget dateComponent(DateTime date) {
    return Text(
      DateFormat.yMMMMd().format(date),
      style: AppTypographies.cardDateTextStyle,
    );
  }
}
