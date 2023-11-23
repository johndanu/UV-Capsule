import 'package:capsule/Models/order_model.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Providers/order_provider.dart';
import 'package:capsule/Screens/payment.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:capsule/widgets/myBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  Future<Order?>? dataFuture;

  late String itemId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is String) {
      itemId = args;
      dataFuture = fetch();
      // Fetch data based on itemId here
    } else {
      // Handle the case where the argument is not of the expected type
    }
  }

  Future<Order?> fetch() async {
    OrderProvider order = Provider.of<OrderProvider>(context, listen: false);

    final query = {"order_id": itemId};
    print(query);
    await order.get_order(queryParams: query);

    return order.order;
  }

  String formatDate(String inputDateString) {
    // Parse the input date string into a DateTime object
    DateTime dateTime = DateTime.parse(inputDateString);

    // Define the date format you want
    final DateFormat formatter = DateFormat('MMMM dd, yyyy');

    // Format the DateTime into a string
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: MyAppBar(),
      body: FutureBuilder<Order?>(
          future: dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('No data available.');
            } else {
              final data = snapshot.data;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: 'Hi ${auth.profile!.first_name} ! ',
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
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
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: data!.images.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    data.images[index],
                                  ),
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
                              data.order_id,
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
                              '${formatDate(data.ordered_at)}',
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
                              data.quantity ?? '',
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
                              "LKR ${data.payment_amount}",
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
                        child: Center(
                          child: Text(
                            data.status,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      if (data.medicines.isNotEmpty)
                        Text(
                          "List of Medicine",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      SizedBox(
                        height: 15,
                      ),
                      if (data.medicines.isNotEmpty)
                        Container(
                          width: double.infinity,
                          child: DataTable(
                              columnSpacing:
                                  20.0, // Adjust the spacing between columns
                              dividerThickness:
                                  0.0, // Remove the lines between rows
                              columns: [
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Medicine',
                                  textAlign: TextAlign.center,
                                ))),
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Tablets\n(Tablets)',
                                  textAlign: TextAlign.center,
                                ))),
                                DataColumn(
                                    label: Expanded(
                                        child: Text(
                                  'Price\n(LKR)',
                                  textAlign: TextAlign.center,
                                ))),
                              ],
                              rows: [
                                ...List<DataRow>.generate(data.medicines.length,
                                    (index) {
                                  final counter = index + 1;
                                  final rowData = data.medicines[index];
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
                                                  rowData['medicine_name'] ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  overflow: TextOverflow
                                                      .ellipsis, // Handle text overflow
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
                                            rowData['quantity'] ?? '',
                                            style: const TextStyle(
                                                color: Colors.black),
                                            overflow: TextOverflow
                                                .ellipsis, // Handle text overflow
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
                                            rowData['amount']
                                                    .toStringAsFixed(2) ??
                                                '',
                                            style: const TextStyle(
                                                color: Colors.black),
                                            overflow: TextOverflow
                                                .ellipsis, // Handle text overflow
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                                DataRow(
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
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15),
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
                                          data.payment_amount
                                              .toStringAsFixed(2),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: double.infinity,
                          decoration:
                              const BoxDecoration(color: Color(0xffE0FEF7)),
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          data.status == "Order Placed" ||
                                                  data.status ==
                                                      "Merchant Confirmed" ||
                                                  data.status == "Paid" ||
                                                  data.status ==
                                                      "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff18645B),
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Color(0xff2AB49E),
                                                    radius: 10,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Color(0xff2AB49E),
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                          data.status == "Order Placed" ||
                                                  data.status ==
                                                      "Merchant Confirmed" ||
                                                  data.status == "Paid" ||
                                                  data.status ==
                                                      "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
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
                                        "Order Placed",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          data.status == "Merchant Confirmed" ||
                                                  data.status == "Paid" ||
                                                  data.status ==
                                                      "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff18645B),
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Color(0xff2AB49E),
                                                    radius: 10,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Color(0xff2AB49E),
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                          data.status == "Merchant Confirmed" ||
                                                  data.status == "Paid" ||
                                                  data.status ==
                                                      "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
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
                                        "Merchant Confirmed",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          data.status == "Paid" ||
                                                  data.status ==
                                                      "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff18645B),
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Color(0xff2AB49E),
                                                    radius: 10,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Color(0xff2AB49E),
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                          data.status == "Paid" ||
                                                  data.status ==
                                                      "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
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
                                        "Paid",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          data.status == "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff18645B),
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Color(0xff2AB49E),
                                                    radius: 10,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Color(0xff2AB49E),
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                          data.status == "Ready for Delivery" ||
                                                  data.status ==
                                                      "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
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
                                        "Ready for Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          data.status == "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff18645B),
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Color(0xff2AB49E),
                                                    radius: 10,
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Color(0xff2AB49E),
                                                      size: 10,
                                                    ),
                                                  ),
                                                ),
                                          data.status == "On Delivery" ||
                                                  data.status ==
                                                      "Order Finished"
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
                                        "On Delivery",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          data.status == "Order Finished"
                                              ? CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xff18645B),
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
                                                    backgroundColor:
                                                        Colors.white,
                                                    foregroundColor:
                                                        Color(0xff2AB49E),
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
                                        "Order Finished",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(height: 30),
                      if (data.status == "Order Placed" ||
                          data.status == "Merchant Confirmed")
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
                                MaterialPageRoute(
                                    builder: (context) => (Payment())),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xff2AB29D),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
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
              );
            }
          }),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
