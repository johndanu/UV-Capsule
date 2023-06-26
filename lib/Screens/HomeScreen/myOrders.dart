import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  List<String> orders = [
    'Order ID - #546-CY\nOrder date - 10th Jan 2023',
    'Order ID - #546\nOrder date - 14th Dec 2022',
    'Order ID - #506\nOrder date - 22th Apr 2022',
    'Order ID - #486\nOrder date - 10th Apr 2022'
  ];
  List<Color> colors = [
    Color(0xffFFC794),
    Color(0xff6CD9F1),
    Color(0xffFF6871),
    Color(0xff6CD9F1),
  ];
  List<String> colorNames = [
    'Payment Pending',
    'Delivered',
    'Rejected',
    'Delivered'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                "My Orders",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              '${orders[index]}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 150,
                            decoration: BoxDecoration(
                              color: colors[index],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Text(
                                colorNames[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
