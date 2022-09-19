import 'package:flutter/material.dart';

import '../../../../theme/app_typography.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'No transactions added yet!',
          style: AppTypographies.noTransactionsTextStyle,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 160,
          child: Image.asset(
            'assets/images/waiting.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
