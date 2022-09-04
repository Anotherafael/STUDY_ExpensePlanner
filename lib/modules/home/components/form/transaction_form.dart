import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:study_expense_planner/modules/home/components/form/transaction_form_input.dart';
import 'package:study_expense_planner/modules/home/home_controller.dart';
import 'package:provider/provider.dart';
import 'package:study_expense_planner/theme/date_picker_theme.dart';

class TransactionFormWidget extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const TransactionFormWidget({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<TransactionFormWidget> createState() => _TransactionFormWidgetState();
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();

  void _cleanInputs() {
    _titleController.text = "";
    _amountController.text = "";
    _dateController.text = "";
    context.read<HomeController>().selectedDate == null;
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return DatePickerTheme(child!);
      },
    ).then((value) {
      if (value == null) return;
      context.read<HomeController>().updateDate(value);
      _dateController.text = DateFormat('yyyy-MM-dd').format(
        context.read<HomeController>().selectedDate!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TransactionFormInputWidget(
              labelText: 'Item',
              hintText: 'Musical Keyboard',
              keyboardType: TextInputType.name,
              controller: _titleController,
            ),
            TransactionFormInputWidget(
              labelText: 'Amount',
              hintText: '299.99',
              keyboardType: TextInputType.number,
              controller: _amountController,
            ),
            Row(
              children: [
                Expanded(
                  child: TransactionFormInputWidget(
                    labelText: 'Date',
                    hintText: 'mm/DD/yyyy',
                    controller: _dateController,
                    icon: Icons.calendar_today,
                    onIconPressed: _showDatePicker,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.formKey.currentState!.validate()) {
                      context.read<HomeController>().addTransaction(
                            _titleController.text,
                            double.parse(_amountController.text),
                            DateTime.parse(_dateController.text),
                          );
                      Navigator.pop(context);
                      _cleanInputs();
                    }
                  },
                  child: const Text('Add Transaction'),
                ),
              ),
            ),
          ],
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