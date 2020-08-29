import 'package:expence_tracker/transaction-view/transaction_detail.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList({this.transactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: TransactionDetails(
                transaction: transactions[index], index: index, remove: removeTransaction),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
