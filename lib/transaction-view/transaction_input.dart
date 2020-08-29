import 'package:expence_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function add;

  TransactionInput({this.add});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Add'),
              onPressed: () => add(Transaction(
                  id: DateTime.now().toString(),
                  title: titleController.text,
                  amount: double.parse(amountController.text),
                  dateTime: DateTime.now())),
            )
          ],
        ),
      ),
    );
  }
}
