import 'package:expence_tracker/transaction-view/transaction_card.dart';
import 'package:flutter/material.dart';
import '../model/transaction.dart';

class TransactionWrapper extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionWrapper({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: transactions
            .map((transaction) => Card(
                  elevation: 5,
                  child: TransactionDetails(transaction: transaction,),
                ))
            .toList());
  }
}
