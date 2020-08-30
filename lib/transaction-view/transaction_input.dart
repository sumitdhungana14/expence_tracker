import 'package:expence_tracker/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionInput extends StatefulWidget {
  final Function add;

  TransactionInput({this.add});

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitted() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title == null || amount == null) {
      return;
    }

    widget.add(Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now()));
    
    Navigator.of(context).pop();
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
