import 'package:flutter/material.dart';

class TransactionEmpty extends StatelessWidget {
  final double deviceHeight;

  TransactionEmpty(this.deviceHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Looks a little empty here!',
              style: Theme.of(context).textTheme.headline6),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/waiting.png',
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
