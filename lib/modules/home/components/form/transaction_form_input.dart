import 'package:flutter/material.dart';

class TransactionFormInputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? enabled;

  const TransactionFormInputWidget({
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Value is empty';
          } else {
            if (labelText == 'Amount' && !isValidAmount(value)) {
              return 'Value must be a number';
            }
          }
          return null;
        },
        enabled: enabled == null ? true : enabled!,
        controller: controller,
        keyboardType: keyboardType == null ? TextInputType.none : keyboardType!,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            gapPadding: 12,
          ),
        ),
      ),
    );
  }

  bool isValidAmount(String value) {
    RegExp regExp = RegExp(r'(^\d*\.?\d*)');
    if (regExp.hasMatch(value)) {
      return true;
    }
    return false;
  }
}
