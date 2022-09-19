import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_expense_planner/modules/home/components/chart/chart.dart';
import 'package:study_expense_planner/modules/home/components/chart/toggle_chart_widget.dart';
import 'package:study_expense_planner/modules/home/components/form/transaction_form.dart';
import 'package:study_expense_planner/modules/home/components/list/empty_list_widget.dart';
import 'package:study_expense_planner/modules/home/components/list/list_transaction_widget.dart';
import 'package:study_expense_planner/theme/app_colors.dart';

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
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final showChart = context.watch<HomeController>().showChart;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (isLandscape) const ToggleChartWidget(),
            if (!isLandscape || showChart)
              ChartTransactionWidget(
                recentTransactions:
                    context.watch<HomeController>().recentTransaction,
              ),
            if (!isLandscape || !showChart)
              Expanded(
                child: context.watch<HomeController>().transactions.isEmpty
                    ? const EmptyListWidget()
                    : const ListTransactionWidget(),
              ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: IconButton(
                onPressed: () => _showDialog(isLandscape),
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

  Future<void> _showDialog(bool isLandscape) async {
    return showDialog<void>(
      useSafeArea: true,
      context: context,
      builder: (context) {
        final mediaQuery = MediaQuery.of(context);
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;
        return AlertDialog(
          alignment: isLandscape ? Alignment.topCenter : Alignment.center,
          actions: [
            SizedBox(
              height: isLandscape
                  ? mediaQuery.size.height * 0.25
                  : mediaQuery.size.height * 0.4,
              width: isLandscape
                  ? mediaQuery.size.width * 0.8
                  : mediaQuery.size.width * 1,
              child: SingleChildScrollView(
                child: TransactionFormWidget(formKey: _formKey),
              ),
            ),
          ],
        );
      },
    );
  }
}
