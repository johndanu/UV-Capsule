import 'package:another_flushbar/flushbar.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Screens/signinOtpPage.dart';
import 'package:capsule/Screens/verficationPage.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupOTP extends StatefulWidget {
  const SignupOTP({super.key});

  @override
  State<SignupOTP> createState() => _SignupOTPState();
}

class _SignupOTPState extends State<SignupOTP> {
  TextEditingController otpController = TextEditingController();
  String? error;

  Future<void> verifyOtp(BuildContext context) async {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    setState(() {
      error = null;
    });

    if (otpController.text != '') {
      Map<String, dynamic> data = {
        "mobile_no": auth.phone,
        "otp_code": otpController.text,
        "is_new_reg": 1,
      };

      final Map<String, dynamic> response = await auth.verifyOtp(data);

      if (response['status']) {
        Navigator.pushReplacementNamed(context, '/verify');
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
    } else {
      // Flushbar(
      //   title: 'Invalid phone numer',
      //   message: 'Please enter valid otp number',
      //   duration: Duration(seconds: 5),
      // ).show(context);

      setState(() {
        error = 'Please enter valid otp number';
      });
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
                    'We have sent the code verification to your Mobile Number +94${auth.phone}',
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
                    controller: otpController,
                    keyboardType: TextInputType.number,
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
                  height: 10,
                ),
                Text(error ?? "",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 184, 41, 41))),
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
                      verifyOtp(context);
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
                            : Text("SUBMIT", style: TextStyle(fontSize: 18));
                      },
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
                    Text("Already have an account?"),
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
