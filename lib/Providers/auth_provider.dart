import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:capsule/Utils/config.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:capsule/Models/auth_model.dart';

enum Status {
  notLoggedIn,
  // NotRegistered,
  loggedIn,
  // Registered,
  authenticating,
  // Registering,
  loggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.notLoggedIn;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  // Future<Map<String, dynamic>> login(String username, String password) async {
  //   try {
  //     var result;

  //     _loggedInStatus = Status.authenticating;
  //     notifyListeners();

  //     final Map<String, String> headers = {'Content-Type': 'application/json'};

  //     final Map<String, dynamic> loginData = {
  //       'grant_type': 'password',
  //       'client_id': '26',
  //       'client_secret': 'SQ9CcoH2jBQNQYRqqXdDhm1hJZSgawjSTjAwiI4P',
  //       'username': username,
  //       'password': password,
  //       'scope': '',
  //     };

  //     //login

  //     final response = await http.post(Uri.parse(Config.login),
  //         body: jsonEncode(loginData), headers: headers);

  //     if (response.statusCode == 200) {
  //       final Map<String, dynamic> responseData = jsonDecode(response.body);

  //       Login auth = Login.fromJson(responseData);

  //       await LoginPreferences().login(auth);

  //       _loggedInStatus = Status.loggedIn;
  //       notifyListeners();

  //       result = {'status': true, 'message': 'Successful', 'user': auth};
  //     } else {
  //       _loggedInStatus = Status.notLoggedIn;
  //       notifyListeners();
  //       result = {
  //         'status': false,
  //         'message': jsonDecode(response.body)['message']
  //       };
  //     }

  //     return result ?? {'status': false, 'message': 'Unknown error occurred'};
  //   } catch (e) {
  //     print(e);
  //     return {'status': false, 'message': 'An error occurred'};
  //   }
  // }
}
