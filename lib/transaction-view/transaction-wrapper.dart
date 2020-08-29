import 'package:flutter/material.dart';
import './../model/transaction.dart';

class TransactionWrapper extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionWrapper({this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: transactions
              .map((transaction) => Card(
                    child: Text(transaction.title),
                  ))
              .toList()),
    );
  }
}
