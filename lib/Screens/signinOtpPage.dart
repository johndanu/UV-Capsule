import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SigninOTP extends StatefulWidget {
  const SigninOTP({super.key});

  @override
  State<SigninOTP> createState() => _SigninOTPState();
}

class _SigninOTPState extends State<SigninOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            children: [
              Text(
                "Sign In",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
              ),
              Text("Verification Code",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
              SizedBox(
                height: 60,
              ),
              Text(
                  "We have sent the code verification to your Mobile Number +9471 900855 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Set border radius
                  border: Border.all(), // Add border
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '    Enter OTP', 
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SigninOTP()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2AB29D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Row(
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
                  TextButton(onPressed: () {}, child: Text("Sign up"))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}