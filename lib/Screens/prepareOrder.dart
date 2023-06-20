import 'package:flutter/material.dart';

class PrepareOrder extends StatefulWidget {
  @override
  _PrepareOrderState createState() => _PrepareOrderState();
}

class _PrepareOrderState extends State<PrepareOrder> {
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Image.asset("assets/images/prescription.png"),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      "Upload your prescription /\n Images",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 160),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          size: 60,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ()),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff2AB29D),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                child: Text(
                  "PLACE THE ORDERS",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
