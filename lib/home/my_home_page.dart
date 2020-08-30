import 'package:expence_tracker/models/transaction.dart';
import 'package:expence_tracker/transaction-view/transaction_input.dart';
import 'package:expence_tracker/transaction-view/transaction_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions;

  void addTransaction(Transaction transaction) {
    setState(() {
      transactions.add(transaction);
    });
  }

  void removeTransaction(int index) {
    setState(() {
      transactions.removeAt(index);
    });
  }

  void startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionInput(add: addTransaction);
        });
  }

  @override
  void initState() {
    super.initState();
    transactions = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expence Tracer',
            style: Theme.of(context).appBarTheme.textTheme.headline6),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
                padding: EdgeInsets.all(50),
                width: double.infinity,
                child: Text('Chart')),
          ),
          TransactionList(
            transactions: transactions,
            removeTransaction: removeTransaction,
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
