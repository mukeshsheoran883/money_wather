import 'package:flutter/foundation.dart';
import 'package:money_wather/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const String tableName = 'User';
  late Database database;

  Future initDatabase() async {
    // Get a location using getDatabasesPath
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, "money_tracker.db");
    database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
        'create table $tableName(email text primary key,dataOfBarth text,address text,name text,password text)',
      );
      if (kDebugMode) {
        print('create successfully');
      }
    });
  }

  Future registerUser(User user) async {
    await database.rawInsert('insert into $tableName values(?,?,?,?,?)',
        [user.email, user.name, user.address, user.dateOfBath, user.password]);
    if (kDebugMode) {
      print('added successfully');
    }
  }

  Future<bool> isUserExists(User user) async {
    List list = await database.rawQuery(
        'select * from $tableName where email=? AND password=? ',
        [user.email, user.password,]);
    if (list.isEmpty) {
      return false;
    }
    return true;
  }



}
