import 'package:capsule/Screens/payment.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:capsule/widgets/myBottomBar.dart';
import 'package:flutter/material.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  List<String> images = [
    'assets/images/grid1.png',
    'assets/images/grid2.png',
    'assets/images/grid3.png',
    'assets/images/grid4.png',
    'assets/images/grid5.png',
  ];

  final List<List<String>> tableData = [
    ['Cell 1', 'Cell 2', 'Cell 3'],
    ['Cell 4', 'Cell 5', 'Cell 6'],
    ['Cell 7', 'Cell 8', 'Cell 9'],
    ['Cell 10', 'Cell 11', 'Cell 12'],
  ];

  int _currentStep = 0;

  List<Step> _stepperList = [
    Step(
      title: Text('Order Placing'),
      content: Text('Step 1 content'),
    ),
    Step(
      title: Text('Waiting for merchant confirmation'),
      content: Text('Step 2 content'),
    ),
    Step(
      title: Text('Confirm and pay'),
      content: Text('Step 3 content'),
    ),
    Step(
      title: Text('Ready for delivery'),
      content: Text('Step 4 content'),
    ),
    Step(
      title: Text('On delivery'),
      content: Text('Step 5 content'),
    ),
    Step(
      title: Text('Order finished'),
      content: Text('Step 6 content'),
    ),
  ];

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
              SizedBox(height: 50),
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
                    TextSpan(
                      text: '\n\nOrder Overview',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                  // Rest of your code
                  ),
              SizedBox(height: 30),
              Text(
                  "Order ID - #546-CY\nOrder date - 10th Jan 2023\nQuantity - For one month\nOrder Value -  LKR 9,450.00"),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffFFC794),
                    borderRadius: BorderRadius.circular(15)),
                height: 25,
                width: 130,
                child: Center(
                  child: Text(
                    "Order Placed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Table(
                children: List.generate(tableData.length + 1, (rowIndex) {
                  if (rowIndex == 0) {
                    // Add table headings
                    return TableRow(
                      children: List.generate(tableData[0].length, (colIndex) {
                        final cellData = tableData[0][colIndex];

                        return Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            cellData,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                    );
                  } else {
                    // Add table rows
                    return TableRow(
                      children: List.generate(tableData[rowIndex - 1].length,
                          (colIndex) {
                        final cellData = tableData[rowIndex - 1][colIndex];

                        return Container(
                          padding: EdgeInsets.all(8.0),
                          margin:
                              EdgeInsets.all(4.0), // Add a small margin for gap
                          decoration: BoxDecoration(color: Color(0xffE0FEF7)),
                          child: Text(
                            cellData,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }),
                    );
                  }
                }),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "Order Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Color(0xffE0FEF7)),
                child: Stepper(
                  currentStep: _currentStep,
                  onStepContinue: () {
                    setState(() {
                      if (_currentStep < _stepperList.length - 1) {
                        _currentStep += 1;
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      if (_currentStep > 0) {
                        _currentStep -= 1;
                      }
                    });
                  },
                  steps: _stepperList,
                ),
              ),
              SizedBox(height: 30),
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
                      MaterialPageRoute(builder: (context) => (Payment())),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2AB29D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "PAY NOW",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
