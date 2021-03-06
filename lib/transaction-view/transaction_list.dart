import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function removeTransaction;

  TransactionList({this.transactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: InkWell(
            onTap: () => removeTransaction(index),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text(
                      '${transactions[index].amount}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ),
              ),
              title: Text('${transactions[index].title}'),
              subtitle:
                  Text(DateFormat.yMMMd().format(transactions[index].dateTime)),
              trailing: MediaQuery.of(context).size.width > 450
                  ? FlatButton.icon(
                      onPressed: () => removeTransaction(index),
                      textColor: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                      label: Text('Delete'))
                  : IconButton(
                      color: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                      onPressed: () => removeTransaction(index)),
            ),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}
