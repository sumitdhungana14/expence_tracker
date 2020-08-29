import 'package:expence_tracker/transaction-view/transaction_input_wrapper.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Expence Tracer'),
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
              TransactionListInputWrapper(),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text(
              '+',
              style: TextStyle(fontSize: 22),
            ),
          ),
        ));
  }
}
