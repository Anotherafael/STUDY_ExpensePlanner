import 'package:flutter/foundation.dart';

import '../../model/transaction.dart';

class HomeController with ChangeNotifier, DiagnosticableTreeMixin {
  final List<Transaction> _transactions = [
    Transaction(
      id: DateTime.now().toString(),
      title: 'Musical Keyboard',
      amount: 299.99,
      date: DateTime.now().subtract(
        const Duration(days: 4),
      ),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'T-Shirt',
      amount: 129.49,
      date: DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ),
  ];

  List<Transaction> get transactions => _transactions;

  List<Transaction> get recentTransaction {
    return transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  DateTime? selectedDate;

  Future<void> addTransaction(
    String title,
    double amount,
    DateTime date,
  ) async {
    transactions.add(
      Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date,
      ),
    );
    notifyListeners();
  }

  Future<void> removeTransaction(String id) async {
    transactions.removeWhere((transaction) => transaction.id == id);
    notifyListeners();
  }

  Future<void> updateDate(DateTime date) async {
    selectedDate = date;
    notifyListeners();
  }
}
