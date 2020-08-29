import 'package:expence_tracker/transaction-view/transaction_detail.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList({this.transactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: transactions
            .map((transaction) => Card(
                  elevation: 5,
                  child: TransactionDetails(transaction: transaction, remove: removeTransaction),
                ))
            .toList());
  }
}
