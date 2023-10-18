import 'package:another_flushbar/flushbar.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Screens/homeScreen.dart';
import 'package:capsule/Screens/signUp.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninOTP extends StatefulWidget {
  const SigninOTP({super.key});

  @override
  State<SigninOTP> createState() => _SigninOTPState();
}

class _SigninOTPState extends State<SigninOTP> {
  TextEditingController otpController = TextEditingController();

  Future<void> verifyOtp(BuildContext context) async {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    if (otpController.text != '') {
      Map<String, dynamic> data = {
        "mobile_no": auth.phone,
        "otp_code": otpController.text,
        "is_new_reg": 0,
      };

      final Map<String, dynamic> response = await auth.verifyOtp(data);

      if (response['status']) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Flushbar(
          title: "Failed",
          message: response['message'].toString(),
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    } else {
      Flushbar(
        title: 'Invalid phone numer',
        message: 'Please enter valid otp number',
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
                    "We have sent the code verification to your Mobile Number +94${auth.phone}",
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
                    controller: otpController,
                    keyboardType: TextInputType.number,
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
                      verifyOtp(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff2AB29D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: Consumer<AuthProvider>(
                      builder: (context, auth, child) {
                        return auth.isLoading
                            ? CircularProgressIndicator()
                            : Text("SUBMIT", style: TextStyle(fontSize: 18));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(height: 20),
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
