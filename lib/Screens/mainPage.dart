import 'package:capsule/Screens/SignIn.dart';
import 'package:capsule/Screens/signUp.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/02.png',
              ),
              Positioned(
                  bottom: 30,
                  right: 80,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: 'Manrope'),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' to Capsule\n Pharmacies Network!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xff2AB29D),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff2AB29D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: Text(
                "SIGN IN",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xff2AB29D),
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary:
                    Color(0xff385592), // Match the container's background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: Text(
                "SIGN UP",
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }
}
