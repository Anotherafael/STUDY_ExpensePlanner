import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../theme/date_picker_theme.dart';
import '../../home_controller.dart';
import 'transaction_form_input.dart';

class FormPortraitState extends StatefulWidget {
  const FormPortraitState({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  State<FormPortraitState> createState() => _FormPortraitStateState();
}

class _FormPortraitStateState extends State<FormPortraitState> {
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
    return Column(
      children: <Widget>[
        TransactionFormInputWidget(
          labelText: 'Item',
          hintText: 'Musical Keyboard',
          keyboardType: TextInputType.text,
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
            margin: const EdgeInsets.only(top: 15),
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
    );
  }
}
