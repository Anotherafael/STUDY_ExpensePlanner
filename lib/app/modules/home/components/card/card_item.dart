import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_expense_planner/app/model/transaction.dart';
import 'package:study_expense_planner/app/modules/home/components/card/card_item_amount.dart';
import 'package:study_expense_planner/app/modules/home/components/card/card_item_title.dart';

import '../../home_controller.dart';

class CardItemWidget extends StatefulWidget {
  final Transaction transaction;

  const CardItemWidget({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  GlobalKey stickyKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.key == null ? GlobalKey() : widget.key!,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: CardItemTitleWidget(
                title: widget.transaction.title,
                date: widget.transaction.date,
              ),
            ),
            CardItemAmountWidget(
              key: stickyKey,
              amount: widget.transaction.amount,
            ),
          ],
        ),
      ),
      onDismissed: (_) {
        context.read<HomeController>().removeTransaction(widget.transaction.id);
      },
    );
  }
}
