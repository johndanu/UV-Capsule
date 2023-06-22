import 'package:capsule/Screens/orderPlaced.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PrepareOrder extends StatefulWidget {
  @override
  _PrepareOrderState createState() => _PrepareOrderState();
}

class _PrepareOrderState extends State<PrepareOrder> {
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
              SizedBox(
                height: 50,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Hi AATHAV ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '\nThank you for your order!',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Stack(
                  children: [
                    Image.asset("assets/images/prepare.png"),
                    Padding(
                      padding: EdgeInsets.only(top: 175),
                      child: Center(
                        child: Text(
                          "Waiting for merchant confirmation",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                height: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 50,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => (OrderPlaced())),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2AB29D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "VIEW YOUR ORDER",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: TextButton(
                      onPressed: () {}, child: Text("Go To My Orders")))
            ],
          ),
        ),
      ),
    );
  }
}
