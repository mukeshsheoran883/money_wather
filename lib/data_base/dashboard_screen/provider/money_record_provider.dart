import 'package:flutter/material.dart';
import 'package:money_wather/data_base/dashboard_screen/model/money_record_model.dart';
import 'package:money_wather/data_base/dashboard_screen/service/money_watcher_firebase_service.dart';
import 'package:money_wather/data_base/shared/app_util.dart';


class MoneyRecordProvider extends ChangeNotifier {
  MoneyRecordProvider(this.firebaseService);
  List<MoneyRecord> moneyRecordList = [];
  MoneyWatcherFirebaseService firebaseService;
  bool isLoading = false;
  String? error;

  Future addMoneyRecord(MoneyRecord moneyRecord) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      await firebaseService.addMoneyRecord(moneyRecord);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getMoneyRecords() async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      moneyRecordList = await firebaseService.fetchMoneyRecord();
      notifyListeners();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future editMoneyRecord(MoneyRecord moneyRecord) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      await firebaseService.editMoneyRecord(moneyRecord.id.toString(), moneyRecord);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future deleteMoneyRecord(String id) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      await firebaseService.deleteMoneyRecord(id);
    } catch (e) {
      error = e.toString();
      AppUtil.showToast(error!);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
