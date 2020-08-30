import 'package:expence_tracker/chart-view/chart_detail.dart';
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

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    });
  }

  double get totalSpendingOfWeek {
    return groupedTransactionValues.fold(
        0.0, (sum, transaction) => sum + transaction['amount']);
  }

  double getPercentageOfTotalSpending(double spending) {
    return spending == 0.0 ? 0.0 : spending / totalSpendingOfWeek;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, //can as well remove this line,
              children: groupedTransactionValues
                  .map((e) => Flexible(
                        fit: FlexFit.tight,
                        child: ChartDetail(
                            e, getPercentageOfTotalSpending(e['amount'])),
                      ))
                  .toList()),
        ));
  }
}
