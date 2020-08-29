import 'package:expence_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function add;

  TransactionInput({this.add});

  void submitted() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title == null || amount == null) {
      return;
    }

    add(Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now()));
  }

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
              onSubmitted: (_) => submitted(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitted(),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            RaisedButton(
              child: Text('Add'),
              onPressed: () => submitted,
            )
          ],
        ),
      ),
    );
  }
}
