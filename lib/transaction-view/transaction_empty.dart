import 'package:flutter/material.dart';

class TransactionEmpty extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Text('Looks a little empty here!',
                        style: Theme.of(context).textTheme.headline6),
                    Container(
                      padding: EdgeInsets.all(20),
                        height: 200,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover))
                  ],
                );
  }
}