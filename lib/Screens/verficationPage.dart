import 'package:capsule/Screens/createProfile.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Verfication extends StatefulWidget {
  const Verfication({super.key});

  @override
  State<Verfication> createState() => _VerficationState();
}

class _VerficationState extends State<Verfication> {
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
                "Sign Up",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 80,
              ),
              Text("Verification Successful!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 60,
              ),
              Text("Your Mobile Number +9471 900855 is verified Successfully!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Icon(
                  Icons.verified,
                  color: Color(0xff2BB7A1),
                  size: 100,
                ),
              ),
              SizedBox(
                height: 50,
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
                      MaterialPageRoute(builder: (context) => CreateProfile()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff3A5896),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "CREATE PROFILE",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
