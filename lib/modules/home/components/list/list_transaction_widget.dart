import 'package:flutter/material.dart';
import 'package:study_expense_planner/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

import '../card/card_item.dart';

class ListTransactionWidget extends StatelessWidget {
  const ListTransactionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, index) {
        return CardItemWidget(
          transaction: context.watch<HomeController>().transactions[index],
        );
      },
      itemCount: context.watch<HomeController>().transactions.length,
    );
  }
}
