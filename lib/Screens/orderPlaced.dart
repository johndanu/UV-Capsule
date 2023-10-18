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

  final List<Map<String, String>> tableData = [
    {
      'Medicine': 'Acetaminophen',
      'Tablets': '28',
      'Price': '560.00',
    },
    {
      'Medicine': 'Amoxicillin',
      'Tablets': '14',
      'Price': '630.00',
    },
    {
      'Medicine': 'Ibuprofen',
      'Tablets': '07',
      'Price': '714.00',
    },
    {
      'Medicine': 'Omeprazole',
      'Tablets': '07',
      'Price': '602.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool step1 = true;
    bool step2 = false;
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
                "List of Medicine",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
    Container(
  width: double.infinity,
  child: DataTable(
    columnSpacing: 20.0, // Adjust the spacing between columns
    dividerThickness: 0.0, // Remove the lines between rows
    columns: [
      DataColumn(label: Expanded(child: Text('Medicine',textAlign: TextAlign.center,))),
      DataColumn(label: Expanded(child: Text('Tablets\n(Tablets)',textAlign: TextAlign.center,))),
      DataColumn(label: Expanded(child: Text('Price\n(LKR)',textAlign: TextAlign.center,))),
    ],
    rows: [...List<DataRow>.generate(tableData.length, (index) {
      final counter = index + 1;
      final rowData = tableData[index];
      return DataRow(
        cells: [
          DataCell(
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Color(0xffE0FEF7),
              ),
              child: Row(
                children: [
                  Text('$counter.'),
                  Expanded(
                    child: Text(
                      rowData['Medicine'] ?? '',
                      style: const TextStyle(color: Colors.black),
                      overflow: TextOverflow.ellipsis, // Handle text overflow
                    ),
                  ),
                ],
              ),
            ),
          ),
          DataCell(
            Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Color(0xffE0FEF7),
              ),
              child: Text(
                rowData['Tablets'] ?? '',
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis, // Handle text overflow
              ),
            ),
          ),
          DataCell(
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Color(0xffE0FEF7),
              ),
              child: Text(
                rowData['Price'] ?? '',
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis, // Handle text overflow
              ),
            ),
          ),
        ],
      );
    }),   DataRow(
        // Add the "Total Price" and "Amount" row
        cells: [
          DataCell(
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                color: Color(0xffE0FEF7),
              ),
              child: Expanded(
                child: Text(
                  'TOTAL PRICE',
                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),
                ),
              ),
            ),
          ),
          DataCell(
            Container(
              child: Text(
                '',
              ),
            ),
          ),
          DataCell(
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Color(0xffE0FEF7),
              ),
              child: Text(
                '2506.00',
                style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),
              ),
            ),
          ),
        ],
      ),
  
            ]),
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
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  step2 == false
                                      ? CircleAvatar(
                                          backgroundColor: Color(0xff18645B),
                                          radius: 13,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff2AB49E),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff2AB49E),
                                            radius: 15,
                                            child: Icon(
                                              Icons.circle,
                                              color: Color(0xff2AB49E),
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                  step2 == false
                                      ? Container(
                                          width: 2,
                                          height: 40,
                                          color: Color(0xff18645B),
                                        )
                                      : Container(
                                          width: 2,
                                          height: 40,
                                          color: Colors.grey,
                                        )
                                ],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Order Placing",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  step1 == false
                                      ? CircleAvatar(
                                          backgroundColor: Color(0xff18645B),
                                          radius: 15,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff2AB49E),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff2AB49E),
                                            radius: 10,
                                            child: Icon(
                                              Icons.circle,
                                              color: Color(0xff2AB49E),
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                  step1 == false
                                      ? Container(
                                          width: 2,
                                          height: 40,
                                          color: Color(0xff18645B),
                                        )
                                      : Container(
                                          width: 2,
                                          height: 40,
                                          color: Colors.grey,
                                        )
                                ],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Waiting for merchant confirmation",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  step1 == false
                                      ? CircleAvatar(
                                          backgroundColor: Color(0xff18645B),
                                          radius: 10,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff2AB49E),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff2AB49E),
                                            radius: 10,
                                            child: Icon(
                                              Icons.circle,
                                              color: Color(0xff2AB49E),
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                  step1 == false
                                      ? Container(
                                          width: 2,
                                          height: 40,
                                          color: Color(0xff18645B),
                                        )
                                      : Container(
                                          width: 2,
                                          height: 40,
                                          color: Colors.grey,
                                        )
                                ],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Order Placing",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  step1 == false
                                      ? CircleAvatar(
                                          backgroundColor: Color(0xff18645B),
                                          radius: 10,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff2AB49E),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff2AB49E),
                                            radius: 10,
                                            child: Icon(
                                              Icons.circle,
                                              color: Color(0xff2AB49E),
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                  step1 == false
                                      ? Container(
                                          width: 2,
                                          height: 40,
                                          color: Color(0xff18645B),
                                        )
                                      : Container(
                                          width: 2,
                                          height: 40,
                                          color: Colors.grey,
                                        )
                                ],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Ready for delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  step1 == false
                                      ? CircleAvatar(
                                          backgroundColor: Color(0xff18645B),
                                          radius: 10,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff2AB49E),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff2AB49E),
                                            radius: 10,
                                            child: Icon(
                                              Icons.circle,
                                              color: Color(0xff2AB49E),
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                  step1 == false
                                      ? Container(
                                          width: 2,
                                          height: 40,
                                          color: Color(0xff18645B),
                                        )
                                      : Container(
                                          width: 2,
                                          height: 40,
                                          color: Colors.grey,
                                        )
                                ],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "On delivery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  step1 == false
                                      ? CircleAvatar(
                                          backgroundColor: Color(0xff18645B),
                                          radius: 10,
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 15,
                                          ),
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Color(0xff2AB49E),
                                              width: 2.0,
                                            ),
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            foregroundColor: Color(0xff2AB49E),
                                            radius: 10,
                                            child: Icon(
                                              Icons.circle,
                                              color: Color(0xff2AB49E),
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(width: 15),
                              Text(
                                "Order finished",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
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
