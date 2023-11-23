import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:capsule/Models/auth_model.dart';

class CapsulePreferences {
  Future<void> login(Login login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('user_id', login.userId ?? '');
  }

  Future<Login> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? token = prefs.getString('user_id');

    return Login(userId: token);
  }

  Future<void> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
