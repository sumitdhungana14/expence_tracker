import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expence_tracker/models/transaction.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;
  final int index;
  final Function remove;

  TransactionDetails({this.transaction, this.index, this.remove});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => remove(index),
      child: Container(
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Text('\$${transaction.amount}',
                style: Theme.of(context).textTheme.headline6),
            decoration:
                BoxDecoration(color: Theme.of(context).primaryColorLight),
            padding: EdgeInsets.all(10),
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.title.toUpperCase(),
                style: Theme.of(context).textTheme.headline6
              ),
              Text(
                DateFormat.yMMMd().format(transaction.dateTime),
                style: Theme.of(context).textTheme.headline5
              )
            ],
          ))
        ]),
      ),
    );
  }
}
