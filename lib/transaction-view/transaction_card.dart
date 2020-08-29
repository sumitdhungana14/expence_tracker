import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expence_tracker/model/transaction.dart';

class TransactionDetails extends StatelessWidget {
  final Transaction transaction;

  TransactionDetails({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Text('Rs. ${transaction.amount}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              )),
          decoration: BoxDecoration(color: Colors.amber),
          padding: EdgeInsets.all(10),
        ),
        Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.title.toUpperCase(),
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              DateFormat.yMMMd().format(transaction.dateTime),
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        ))
      ]),
    );
  }
}
