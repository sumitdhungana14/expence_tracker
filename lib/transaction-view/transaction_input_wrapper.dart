import 'package:expence_tracker/models/transaction.dart';
import 'package:expence_tracker/transaction-view/transaction_input.dart';
import 'package:expence_tracker/transaction-view/transaction_list.dart';
import 'package:flutter/material.dart';

class TransactionListInputWrapper extends StatefulWidget {
  @override
  _TransactionListInputWrapperState createState() =>
      _TransactionListInputWrapperState();
}

class _TransactionListInputWrapperState
    extends State<TransactionListInputWrapper> {
  List<Transaction> transactions;

  void addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  void removeTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    transactions = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionInput(add: addTransaction),
        TransactionList(
          transactions: transactions,
          removeTransaction: removeTransaction,
        ),
      ],
    );
  }
}
