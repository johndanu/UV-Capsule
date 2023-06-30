import 'package:capsule/Screens/loadingPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loading Page Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
     
        ),
        home: LoadingPage(),
      ),
    );
  }
}
