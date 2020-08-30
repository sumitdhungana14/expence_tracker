import 'package:expence_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWrapper extends StatelessWidget {
  final List<Transaction> recentTransactions;

  ChartWrapper(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      var currentWeekDayTransaction = recentTransactions.where((transaction) {
        var dateTime = transaction.dateTime;
        return dateTime.day == weekDay.day &&
            dateTime.month == weekDay.month &&
            dateTime.year == weekDay.year;
      }).toList();

      currentWeekDayTransaction
          .forEach((element) => totalSum += element.amount);

      return {'day': DateFormat.E().format(weekDay).substring(0,1), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text('Chart')),
    );
  }
}
