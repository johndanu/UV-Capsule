import 'package:capsule/Screens/prepareOrder.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:capsule/widgets/myBottomBar.dart';
import 'package:flutter/material.dart';

class UploadPrescription extends StatefulWidget {
  @override
  _UploadPrescriptionState createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'Simply upload your prescription or photos to get your medicine to your door step',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Stack(
                  children: [
                    Image.asset("assets/images/prescription.png"),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        "Upload your prescription /\n Images",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                height: 200,
                width: double.infinity,
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Any Remark',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a remark';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Auto fill by Profile details"),
                  Switch(
                    value: toggleValue,
                    onChanged: (value) {
                      setState(() {
                        toggleValue = value;
                      });
                    },
                  ),
                ],
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Customer Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the customer name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Customer Phone',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the customer phone';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Delivery Address',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the delivery address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
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
                      MaterialPageRoute(builder: (context) => (PrepareOrder())),
                    );
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
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
