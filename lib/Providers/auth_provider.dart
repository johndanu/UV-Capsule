import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:capsule/Utils/config.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:capsule/Models/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Profile? _profile;

  Profile? get profile => _profile;

  bool get loading => isLoading;

  String phone = '';

  Future<Map<String, dynamic>> getOtp(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();

    var result;
    try {
      final response = await http.post(
        Uri.parse(Config.getOtp),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data['data'];

        print(data);

        result = {'status': true, 'message': "success"};
        phone = body['mobile_no'];

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();

        final data = jsonDecode(response.body);
        final msg = data['error'];
        print(msg);
        print(response.statusCode);
        result = {'status': false, 'message': '$msg'};
      }
      return result;
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
      return result;
    }
  }

  Future<Map<String, dynamic>> verifyOtp(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();

    var result;
    try {
      final response = await http.post(
        Uri.parse(Config.verifyOtp),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data['data'];

        print(data);

        if (jsonData['user_id'] != "") {
          Login auth = Login.fromJson(jsonData);
          await CapsulePreferences().login(auth);
        }

        result = {'status': true, 'message': "success"};

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();

        final data = jsonDecode(response.body);
        final msg = data['error'];
        print(msg);
        print(response.statusCode);
        result = {'status': false, 'message': '$msg'};
      }
      return result;
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
      return result;
    }
  }

  Future<Map<String, dynamic>> createProfile(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();

    var result;
    try {
      final response = await http.post(
        Uri.parse(Config.createProfie),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data['data'];

        print(data);

        Login auth = Login.fromJson(jsonData);
        await CapsulePreferences().login(auth);

        result = {'status': true, 'message': "success"};

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();

        final data = jsonDecode(response.body);
        final msg = data['error'];
        print(msg);
        print(response.statusCode);
        result = {'status': false, 'message': '$msg'};
      }
      return result;
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
      return result;
    }
  }

  Future getProfile({Map<String, dynamic>? queryParams}) async {
    String apiUrl = Config.viewProfie;

    if (queryParams != null) {
      final convertedParams = queryParams.map((key, value) {
        if (value is int || value is double) {
          return MapEntry(key, value.toString());
        } else {
          return MapEntry(key, value.toString());
        }
      });

      Uri uri = Uri.parse(apiUrl).replace(queryParameters: convertedParams);
      apiUrl = uri.toString();
    }

    try {
      var result;
      isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final jsonData = data['data'];

        _profile = Profile.fromJson(jsonData);
        result = {'status': true, 'message': 'Successful'};

        isLoading = false;
        notifyListeners();
      } else {
        _profile = null;
        final data = jsonDecode(response.body);
        final msg = data['error'];
        print(msg);
        print(response.statusCode);
        result = {'status': false, 'message': '$msg'};
      }
      return result;
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();

      return {'status': false, 'message': 'Failed to fetch data3'};
    }
  }
}
