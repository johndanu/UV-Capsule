import 'package:capsule/Screens/homeScreen.dart';
import 'package:capsule/Screens/signUp.dart';
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
      body: SingleChildScrollView(
        child: Padding(
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
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 60,
                ),
                Text(
                    "We have sent the code verification to your Mobile Number +9471 900855 ",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 60,
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
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
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
                        MaterialPageRoute(builder: (context) => HomeScreen()),
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
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height:20),
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
