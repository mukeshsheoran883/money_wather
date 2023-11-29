import 'package:flutter/material.dart';
import 'package:money_wather/dashboard_screen/ui/money_record_chart_screen.dart';
import 'package:money_wather/dashboard_screen/ui/money_record_list_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabScreenList = [
    const MoneyRecordListScreen(),
    const MoneyRecordChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              setState(() {});
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.view_list),
              label: 'Money Record',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Chart',
            ),
          ],
        ),
        body: _tabScreenList[_selectedIndex],
      ),
    );
  }
}
