import 'package:flutter/material.dart';

class ChartDetail extends StatelessWidget {

  final Map<String, Object> transactionDetail;
  final double heightFactor;

  ChartDetail(this.transactionDetail, this.heightFactor);

  double get amount {
    return transactionDetail['amount'];
  }

  String get day {
    return transactionDetail['day'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(
              child: Text(
          '\$${amount.toStringAsFixed(0)}'
        ),
      ),
      SizedBox(height: 5,),
      Container(
        height: 60,
        width: 10,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          FractionallySizedBox(
            heightFactor: heightFactor,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          )
        ],)
      ),
      SizedBox(height: 5,),
      Text(
        day
      )
    ],);
  }
}