import 'dart:async';

import 'package:capsule/Models/auth_model.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Providers/order_provider.dart';
import 'package:capsule/Screens/mainPage.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    loading();
  }

  void loading() async {
    Login data = await CapsulePreferences().getUser();
    OrderProvider order = Provider.of<OrderProvider>(context, listen: false);
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    if (data.userId != null) {
      final query = {"user_id": data.userId};
      await auth.getProfile(queryParams: query);
    }

    Timer(Duration(seconds: 5), () {
      if (data.userId == null) {
        Navigator.pushReplacementNamed(context, '/main');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/images/loading.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "CAPSULE",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
