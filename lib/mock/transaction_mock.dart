import 'package:expence_tracker/model/transaction.dart';

class TransactionMock extends Transaction {
  static List<Transaction> getAll() {
    return [
      Transaction(
          id: 't1', title: 'shoe', amount: 29.22, dateTime: DateTime.now()),
      Transaction(
          id: 't2', title: 'groceries', amount: 35.66, dateTime: DateTime.now())
    ];
  }
}
