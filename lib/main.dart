import 'package:flutter/material.dart';
import 'package:money_wather/dashboard_screen/provider/money_record_provider.dart';
import 'package:money_wather/dashboard_screen/ui/dashboard_screen.dart';
import 'package:money_wather/login/provider/auth_provider.dart';

import 'package:money_wather/shared/app_colors.dart';
import 'package:money_wather/shared/app_string.dart';
import 'package:money_wather/shared/database_service.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseService databaseService = DatabaseService();
  await databaseService.initDatabase();
  runApp(MyApp(
    databaseService: databaseService,
  ));
}

class MyApp extends StatelessWidget {
  final DatabaseService databaseService;

  const MyApp({super.key, required this.databaseService});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AuthProvider(databaseService);
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return MoneyRecordProvider(databaseService);
          },
        )
      ],
      child: MaterialApp(
        title: appName,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: appColorScheme),
          useMaterial3: true,
        ),
        home: const DashBoardScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
