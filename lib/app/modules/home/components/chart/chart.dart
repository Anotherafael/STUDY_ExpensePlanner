import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_expense_planner/app/modules/home/components/chart/chart_bar.dart';

import '../../../../model/transaction.dart';

class ChartTransactionWidget extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const ChartTransactionWidget({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  /// Creating a list of maps, expected to be {String, double}.
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      /// Subtracting the days from the current date.
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      /// Checking if the transaction date is the same as the weekDay date.
      for (var transaction in recentTransactions) {
        if (transaction.date.day == weekDay.day &&
            transaction.date.month == weekDay.month &&
            transaction.date.year == weekDay.year) {
          totalSum += transaction.amount;
        }
      }

      /// Returning a map with the day and amount.
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBarWidget(
                label: (data['day'] as String),
                spendingAmount: (data['amount'] as double),
                spendingPctOfTotal: totalSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
