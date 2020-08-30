import 'package:flutter/material.dart';

class MyAppBar {

  static PreferredSizeWidget appBar(BuildContext context, Function startAddNewTransaction) {
    return AppBar(
        title: Text('Expence Tracer',
            style: Theme.of(context).appBarTheme.textTheme.headline6),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      );
  }
}