import 'package:capsule/Models/order_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:capsule/Utils/config.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:image_picker/image_picker.dart';

class OrderProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Orders> _orders = [];
  Order? _order;

  List<Orders> get orders => _orders;
  Order? get order => _order;
  final Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Map<String, dynamic>> placeOrder(Map<String, dynamic> body) async {
    isLoading = true;
    notifyListeners();

    var result;
    try {
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(Config.placeOrder),
      );

      List<XFile> image = body['image'];
      List<http.MultipartFile> imageParts = [];

      for (XFile image in image) {
        final imagePart =
            await http.MultipartFile.fromPath('image[]', image.path);
        imageParts.add(imagePart);
      }

      // Add all image parts to the request
      for (var imagePart in imageParts) {
        request.files.add(imagePart);
      }
      request.fields['user_id'] = body['user_id'];
      request.fields['remarks'] = body['remarks'];
      request.fields['user_id'] = body['user_id'];
      request.fields['customer_name'] = body['customer_name'];
      request.fields['customer_phone'] = body['customer_phone'];
      request.fields['delivery_address'] = body['delivery_address'];

      final response = await request.send();
      print(response.statusCode);
      final responseStream = response.stream;

      final responseBytes = await responseStream.toBytes();
      final responseBody = utf8.decode(responseBytes);

      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = json.decode(responseBody);

        String orderId = responseJson['data']['order_id'];
        result = {'status': true, 'message': "success", 'orderId': orderId};

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();

        String responseBody = await response.stream.bytesToString();

        Map<String, dynamic> responseJson = json.decode(responseBody);
        String errorMessage = responseJson['error']['document'];

        print(response.statusCode);
        print(errorMessage);
        result = {'status': false, 'message': errorMessage};
      }
      return result;
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
      return result;
    }
  }

  Future getAllOrders({Map<String, dynamic>? queryParams}) async {
    var result;
    try {
      String apiUrl = Config.getAllOrders;

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

      isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(apiUrl), headers: headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List<dynamic> jsonData = data['data'];
        _orders = jsonData.map((item) => Orders.fromJson(item)).toList();

        result = {'status': true, 'message': 'Successful'};

        isLoading = false;
        notifyListeners();
      } else {
        _orders = [];
        isLoading = false;
        notifyListeners();
        final data = jsonDecode(response.body);
        final msg = data['error'];
        return {'status': false, 'message': '$msg'};
      }

      return result ?? {'status': false, 'message': 'Unknown error occurred'};
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();

      return {'status': false, 'message': 'Failed to fetch data3'};
    }
  }

  Future get_order({Map<String, dynamic>? queryParams}) async {
    String apiUrl = Config.getSingleOrder;

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
        final jsonData = data['data'][0];

        _order = Order.fromJson(jsonData);
        result = {'status': true, 'message': 'Successful'};

        isLoading = false;
        notifyListeners();
      } else {
        _order = null;
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
