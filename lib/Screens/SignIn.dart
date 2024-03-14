import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Screens/signUp.dart';
import 'package:capsule/Screens/signinOtpPage.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController phoneNumberController = TextEditingController();
  bool resent = false;

  String? error;

  @override
  void initState() {
    super.initState();
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    setState(() {
      phoneNumberController.text = auth.phone;
    });
  }

  Future<void> requestOtp(BuildContext context) async {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    setState(() {
      resent = false;
      error = null;
    });
    if (phoneNumberController.text != '') {
      Map<String, dynamic> data = {
        "mobile_no": phoneNumberController.text,
        "is_new_reg": 0,
      };

      final Map<String, dynamic> response = await auth.getOtp(data);

      if (response['status']) {
        Navigator.pushNamed(context, '/signIn-otp');
      } else {
        // Flushbar(
        //   title: "Failed",
        //   message: response['message'].toString(),
        //   duration: const Duration(seconds: 3),
        // ).show(context);
        setState(() {
          error = response['message'].toString();
        });
      }

      Timer(Duration(minutes: 3), () {
        setState(() {
          resent = true;
        });
      });
    } else {
      // Flushbar(
      //   title: 'Invalid phone numer',
      //   message: 'Please enter valid phone number',
      //   duration: Duration(seconds: 5),
      // ).show(context);
      setState(() {
        error = 'Please enter valid phone number';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text("Hello, Welcome back to your Account!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 100,
              ),
              IntlPhoneField(
                controller: phoneNumberController,
                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                decoration: const InputDecoration(
                  labelText: 'Enter your mobile Number',
                  labelStyle: TextStyle(fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'LK',
                onChanged: (phone) {
                  if (phone.isValidNumber()) {
                    phoneNumberController.text = phone.number;
                  } else {
                    phoneNumberController.text = '';
                  }
                },
              ),
              Center(
                child: Text(error ?? "",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 184, 41, 41))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff2AB29D),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    requestOtp(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2AB29D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Consumer<AuthProvider>(
                    builder: (context, auth, child) {
                      return auth.isLoading
                          ? CircularProgressIndicator()
                          : Text("REQUEST OTP",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xffffffff)));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (resent)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't get the OTP?"),
                    TextButton(
                        onPressed: () {
                          requestOtp(context);
                        },
                        child: Text("Resend",
                            style: TextStyle(color: Color(0xff2BB7A1))))
                  ],
                ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                      )),
                  Text("Don't have an acccount?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text("Sign up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 196, 247, 239))))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
