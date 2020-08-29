import 'package:flutter/material.dart';

class TransactionInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height:10),
            RaisedButton(
              child: Text('Add'),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
