import 'dart:async';

import 'package:another_flushbar/flushbar.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Screens/signupOtpPage.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import 'SignIn.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController phoneNumberController = TextEditingController();
  bool resent = false;

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
    });
    if (phoneNumberController.text != '') {
      Map<String, dynamic> data = {
        "mobile_no": phoneNumberController.text,
        "is_new_reg": 1,
      };

      final Map<String, dynamic> response = await auth.getOtp(data);

      if (response['status']) {
        Navigator.pushNamed(context, '/signUp-otp');
      } else {
        Flushbar(
          title: "Failed",
          message: response['message'].toString(),
          duration: const Duration(seconds: 3),
        ).show(context);
      }

      Timer(Duration(minutes: 3), () {
        setState(() {
          resent = true;
        });
      });
    } else {
      Flushbar(
        title: 'Invalid phone numer',
        message: 'Please enter valid phone number',
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
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
                  "Sign Up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text("Hello, Welcome to Capsule!",
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
                    primary: Color(0xff3A5896),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Consumer<AuthProvider>(
                    builder: (context, auth, child) {
                      return auth.isLoading
                          ? CircularProgressIndicator()
                          : Text("REQUEST OTP", style: TextStyle(fontSize: 18));
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
                  Text("Already have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Color(0xff2BB7A1)),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
