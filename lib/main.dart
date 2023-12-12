import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:money_wather/data_base/dashboard_screen/provider/money_record_provider.dart';
import 'package:money_wather/data_base/firebase_auth_service/auth_service.dart';
import 'package:money_wather/data_base/login/provider/auth_provider.dart';
import 'package:money_wather/data_base/login/ui/login_screen.dart';
import 'package:money_wather/data_base/shared/app_colors.dart';
import 'package:money_wather/data_base/shared/app_string.dart';
import 'package:money_wather/data_base/shared/database_service.dart';
import 'package:money_wather/firebase_options.dart';

import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
            return AuthProvider(AuthService());
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
        home: const LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
