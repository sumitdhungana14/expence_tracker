import 'package:expence_tracker/app-bar/app_%20bar.dart';
import 'package:expence_tracker/chart-view/chart_wrapper.dart';
import 'package:expence_tracker/models/transaction.dart';
import 'package:expence_tracker/transaction-view/transaction_empty.dart';
import 'package:expence_tracker/transaction-view/transaction_input.dart';
import 'package:expence_tracker/transaction-view/transaction_list.dart';
import 'package:expence_tracker/utils/device_info.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> transactions;

  bool showChart = true;

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

  List<Transaction> get lastSevenDaysTransaction {
    return transactions
        .where((transaction) =>
            transaction.dateTime.difference(DateTime.now()).inDays < 7)
        .toList();
  }

  List<Widget> getPortraitContent(double deviceHeight, Widget txList) {
    return [
      Container(
          height: deviceHeight * 0.3,
          child: ChartWrapper(lastSevenDaysTransaction)),
      txList
    ];
  }

  List<Widget> getLandscapeContent(
      double deviceHeight, Widget txList, Widget toogleWidget) {
    return [
      toogleWidget,
      showChart
          ? Container(
              height: deviceHeight * 0.7,
              child: ChartWrapper(lastSevenDaysTransaction))
          : txList,
    ];
  }

  @override
  void initState() {
    super.initState();
    transactions = [];
  }

  @override
  Widget build(BuildContext context) {
    final appBar = MyAppBar.appBar(context, startAddNewTransaction);
    final deviceHeight = DeviceInfo.getDeviceHeight(context, appBar);
    final txList = Container(
      height: deviceHeight * 0.7,
      child: TransactionList(
        transactions: transactions,
        removeTransaction: removeTransaction,
      ),
    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final toggleWidget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Show chart"),
        Switch(
          value: showChart,
          onChanged: (val) {
            setState(() {
              showChart = val;
            });
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          transactions.isEmpty
              ? Center(child: TransactionEmpty(deviceHeight))
              : Column(
                  children: [
                    if (isLandscape)
                      ...getLandscapeContent(deviceHeight, txList, toggleWidget),
                    if (!isLandscape)
                      ...getPortraitContent(deviceHeight, txList)
                  ],
                )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
