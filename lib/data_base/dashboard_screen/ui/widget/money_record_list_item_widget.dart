import 'package:flutter/material.dart';
import 'package:money_wather/data_base/dashboard_screen/model/money_record_model.dart';

class MoneyRecordListItemWidget extends StatelessWidget {
  const MoneyRecordListItemWidget({
    super.key,
    required this.moneyRecord,
  });

  final MoneyRecord moneyRecord;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.058,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: moneyRecord.type == MoneyRecordType.expense
            ? Colors.red[100]
            : Colors.green[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            moneyRecord.title,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
          ),
          Text(
            moneyRecord.amount.toString(),
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
          ),
        ],
      ),
    );
  }
}