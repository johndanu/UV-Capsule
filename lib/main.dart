import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Screens/SignIn.dart';
import 'package:capsule/Screens/homeScreen.dart';
import 'package:capsule/Screens/loadingPage.dart';
import 'package:capsule/Screens/mainPage.dart';
import 'package:capsule/Screens/signUp.dart';
import 'package:capsule/Screens/signinOtpPage.dart';
import 'package:capsule/Screens/signupOtpPage.dart';
import 'package:capsule/Screens/verficationPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            '/home': (context) => HomeScreen(),
            '/main': (context) => MainPage(),
            '/sign-up': (context) => SignUp(),
            '/signUp-otp': (context) => SignupOTP(),
            '/sign-in': (context) => SignIn(),
            '/signIn-otp': (context) => SigninOTP(),
            '/verify': (context) => Verfication(),
          },
        ),
      ),
    );
  }
}
