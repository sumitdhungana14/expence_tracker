import 'package:expence_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInput extends StatefulWidget {
  final Function add;

  TransactionInput({this.add});

  @override
  _TransactionInputState createState() => _TransactionInputState();
}

class _TransactionInputState extends State<TransactionInput> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime transactionDate;

  void submitted() {
    String title = titleController.text;
    double amount = double.parse(amountController.text);

    if (title == null || amount == null || transactionDate == null) {
      return;
    }

    widget.add(Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: transactionDate));

    Navigator.of(context).pop();
  }

  void bringDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((dateTime) {
      if (dateTime == null) {
        return;
      }
      setState(() {
        transactionDate = dateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              top: 15,
              right: 15,
              left: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 15),
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
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Row(children: [
                  transactionDate == null
                      ? Text('Pick a date!')
                      : Text(DateFormat.yMMMd().format(transactionDate)),
                  IconButton(
                    icon: Icon(
                      Icons.calendar_today,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => bringDatePicker(context),
                    iconSize: 30,
                  )
                ]),
              ),
              RaisedButton(
                child: Text('Add'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: submitted,
              )
            ],
          ),
        ),
      ),
    );
  }
}
