import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:money_wather/data_base/login/model/user.dart';

class AuthService {
  Future<bool> login(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
      return true;
    } catch (e) {
      if (kDebugMode) {
        print('Error dating login: $e');
      }
      return false;
    }
  }

  Future signUp(UserModel userModel) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );
    } catch (e) {
      rethrow;
    }
  }
}
