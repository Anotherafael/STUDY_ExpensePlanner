import 'package:flutter/material.dart';
import 'package:study_expense_planner/modules/home/components/form/form_portrait_state.dart';

class TransactionFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const TransactionFormWidget({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: FormPortraitState(
          formKey: formKey,
        ),
      ),
    );
  }
}

//                   Expanded(
//                     child: Text(
//                       context.watch<HomeController>().selectedDate == null
//                           ? 'No Date Chosen!'
//                           : 'Picked Date: ${DateFormat.yMd().format(context.read<HomeController>().selectedDate!)}',
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () => _showDatePicker(),
//                     child: const Text(
//                       'Choose Date',
//                       style: TextStyle(
//                         fontFamily: 'Quicksand',
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),