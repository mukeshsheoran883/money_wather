import 'package:flutter/material.dart';
import 'package:money_wather/dashboard_screen/model/money_record_model.dart';
import 'package:money_wather/dashboard_screen/provider/money_record_provider.dart';
import 'package:money_wather/dashboard_screen/ui/add_money_record_screen.dart';
import 'package:money_wather/dashboard_screen/ui/show_money_record_screen.dart';
import 'package:money_wather/dashboard_screen/ui/widget/money_record_list_item_widget.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      fetchMoneyRecord();
    });

    super.initState();
  }

  Future fetchMoneyRecord() async {
    final moneyProvider =
        Provider.of<MoneyRecordProvider>(context, listen: false);
    moneyProvider.getMoneyRecords();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: openAddMoneyRecordScreen,
          child: const Icon(Icons.add),
        ),
        body: Consumer<MoneyRecordProvider>(
          builder: (context, moneyRecordProvider, widget) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    MoneyRecord moneyRecord =
                        moneyRecordProvider.moneyRecordList[index];
                    return InkWell(onTap: (){
                      openShowMoneyRecordScreen(moneyRecord);
                    },
                      child: MoneyRecordListItemWidget(
                        moneyRecord: moneyRecord,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: moneyRecordProvider.moneyRecordList.length),
            );
          },
        ),
      ),
    );
  }

  void openShowMoneyRecordScreen(MoneyRecord moneyRecord){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ShowMoneyRecordScreen(moneyRecord: moneyRecord);
    },)
    );
  }

  void openAddMoneyRecordScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const AddMoneyRecordScreen();
    }));
  }
}
