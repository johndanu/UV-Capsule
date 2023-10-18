import 'package:capsule/Screens/afterBookNow.dart';
import 'package:capsule/Screens/loadingPage.dart';
import 'package:capsule/Screens/mainPage.dart';
import 'package:capsule/Screens/orderPlaced.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/auth_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Login> getUserData() {
      return CapsulePreferences().getUser();
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Capsule',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoadingPage(),
          routes: {
            '/loading': (context) => LoadingPage(),
            '/main': (context) => MainPage(),
          },
        ),
      ),
    );
  }
}
