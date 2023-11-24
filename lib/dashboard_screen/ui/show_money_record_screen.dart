import 'package:flutter/material.dart';
import 'package:money_wather/dashboard_screen/model/money_record_model.dart';
import 'package:money_wather/shared/app_string.dart';

class ShowMoneyRecordScreen extends StatelessWidget {
  final MoneyRecord moneyRecord;

  const ShowMoneyRecordScreen({Key? key, required this.moneyRecord})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: moneyRecord.type == MoneyRecordType.expense
          ? Colors.green[100]
          : Colors.red[100],
      appBar: AppBar(
        backgroundColor: moneyRecord.type == MoneyRecordType.expense
            ? Colors.red[100]
            : Colors.green[100],
        title: Text(
          moneyRecord.type == MoneyRecordType.expense ? 'Expense' : 'Income',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: const Text(
                  '$category :',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                trailing: Text(
                  moneyRecord.category,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  '$date :',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                trailing: Text(
                  _formatDate(moneyRecord.date),
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  '$hintTextTitle :',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                trailing: Text(
                  moneyRecord.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  '$hintTextAmount :  ',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                trailing: Text(
                  '${moneyRecord.amount}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(int millisecondsSinceEpoch) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
    return "${dateTime.day}-${dateTime.month}-${dateTime.year}";
  }
}
