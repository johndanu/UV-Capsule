import 'package:capsule/Screens/signinOtpPage.dart';
import 'package:capsule/Screens/verficationPage.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SignupOTP extends StatefulWidget {
  const SignupOTP({super.key});

  @override
  State<SignupOTP> createState() => _SignupOTPState();
}

class _SignupOTPState extends State<SignupOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 70,
                ),
                Text("Verification Code",
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 60,
                ),
                Text(
                    "We have sent the code verification to your Mobile Number +9471 900855 ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(10), // Set border radius
                    border: Border.all(), // Add border
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Enter OTP',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w300), // Set hint text
                      border: InputBorder.none, // Remove default border
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff3A5896),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Verfication()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff3A5896),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
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
                            MaterialPageRoute(
                                builder: (context) => SigninOTP()),
                          );
                        },
                        child: Text("Sign In",
                            style: TextStyle(color: Color(0xff2BB7A1))))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
