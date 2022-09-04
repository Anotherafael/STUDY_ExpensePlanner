import 'package:flutter/material.dart';
import 'package:study_expense_planner/theme/app_colors.dart';

class CardItemAmountWidget extends StatelessWidget {
  final double amount;

  const CardItemAmountWidget({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.secondaryColor,
        maxRadius: 35,
        child: amountComponent(amount),
      ),
    );
  }

  Widget amountComponent(double amount) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: FittedBox(
        child: Text(
          'R\$${amount.toString()}',
          style: TextStyle(
            color: AppColors.white,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
    );
  }
}
