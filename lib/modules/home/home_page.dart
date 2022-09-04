import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_expense_planner/modules/home/components/chart/chart.dart';
import 'package:study_expense_planner/modules/home/components/form/transaction_form.dart';
import 'package:study_expense_planner/modules/home/components/list/list_transaction.dart';
import 'package:study_expense_planner/theme/app_colors.dart';
import 'package:study_expense_planner/theme/app_typography.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = "Expense Planner";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ChartTransactionWidget(
              recentTransactions:
                  context.watch<HomeController>().recentTransaction,
            ),
            Expanded(
              child: context.watch<HomeController>().transactions.isEmpty
                  ? Column(
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
                    )
                  : const ListTransactionWidget(),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: IconButton(
                onPressed: () => _showDialog(),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Align(
            alignment: Alignment.center,
            child: Text('Transaction Form'),
          ),
          actions: [
            TransactionFormWidget(formKey: _formKey),
          ],
        );
      },
    );
  }
}
