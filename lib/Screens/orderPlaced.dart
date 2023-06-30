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
    ['Medicine', 'Tablets', 'Price'],
    ['Acetaminophe ', '28', '560.00'],
    ['Amoxicilli', '14', '630.00'],
    ['Ibuprofen ', '07', '714.00'],
  ];

  int _currentStep = 0;

  List<Step> _stepperList = [
    const Step(
      title: Text('Order Placing'),
      content: Text('Step 1 content'),
    ),
    const Step(
      title: Text('Waiting for merchant confirmation'),
      content: Text('Step 2 content'),
    ),
    const Step(
      title: Text('Confirm and pay'),
      content: Text('Step 3 content'),
    ),
    const Step(
      title: Text('Ready for delivery'),
      content: Text('Step 4 content'),
    ),
    const Step(
      title: Text('On delivery'),
      content: Text('Step 5 content'),
    ),
    const Step(
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
              const SizedBox(height: 50),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Hi Siva ! ',
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
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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

              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Order ID - ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Center(
                    child: Text(
                      "#546-CY",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "date - ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Center(
                    child: Text(
                      "10th Jan 2023",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Quantity - ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Center(
                    child: Text(
                      "For one month",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Order Value -  ",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Center(
                    child: Text(
                      "LKR 9,450.00",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  )
                ],
              ),

              // Text(
              //     "Order ID - #546-CY\nOrder date - 10th Jan 2023\nQuantity - For one month\nOrder Value -  LKR 9,450.00",style: TextStyle(),),
              const SizedBox(
                height: 10,
              ),

              Container(
                decoration: BoxDecoration(
                    color: const Color(0xffFFC794),
                    borderRadius: BorderRadius.circular(15)),
                height: 25,
                width: 130,
                child: const Center(
                  child: Text(
                    "Order Placed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Order Status",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              Table(
                children: List.generate(tableData.length + 1, (rowIndex) {
                  if (rowIndex == 0) {
                    // Add table headings
                    return TableRow(
                      children: List.generate(tableData[0].length, (colIndex) {
                        final cellData = tableData[0][colIndex];

                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cellData,
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.all(
                              4.0), // Add a small margin for gap
                          decoration:
                              const BoxDecoration(color: Color(0xffE0FEF7)),
                          child: Text(
                            cellData,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }),
                    );
                  }
                }),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Order Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: Color(0xffE0FEF7)),
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
              const SizedBox(height: 30),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
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
                    primary: const Color(0xff2AB29D),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: const Text(
                    "PAY NOW",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
