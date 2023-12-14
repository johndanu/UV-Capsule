import 'package:capsule/Models/auth_model.dart';
import 'package:capsule/Models/order_model.dart';
import 'package:capsule/Providers/order_provider.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  Future<List<Orders?>>? _ordersFuture;

  String formatDate(String dateString) {
    final inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    final outputFormat = DateFormat("d 'of' MMM y");

    final date = inputFormat.parse(dateString);
    final formattedDate = outputFormat.format(date);

    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    print('object');
    _ordersFuture = fetch(); // Move initialization to initState
  }

  Future<List<Orders>> fetch() async {
    print('fetch function called');
    Login data = await CapsulePreferences().getUser();
    OrderProvider order = Provider.of<OrderProvider>(context, listen: false);

    final query = {"user_id": data.userId};
    await order.getAllOrders(queryParams: query);

    return order.orders;
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider order = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
        appBar: MyAppBar(),
        body: FutureBuilder<List<Orders?>>(
            future: _ordersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error loading orders'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Text('No Orders Available'),
                );
              } else {
                List<Orders?> list = snapshot.data!.reversed.toList();

                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          "My Orders",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        list.isEmpty
                            ? Center(
                                child: Text('No Orders Available'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: list.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/order',
                                          arguments: list[index]!.order_id);
                                    },
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Text(
                                                'Order ID - ${list[index]!.order_id}\nOrder date - ${formatDate(list[index]!.ordered_at)}',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                            Container(
                                              height: 20,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFFC794),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  list[index]!.status,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  ),
                );
              }
            }));
  }
}
