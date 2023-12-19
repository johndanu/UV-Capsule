import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Providers/order_provider.dart';
import 'package:capsule/Screens/prepareOrder.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:capsule/widgets/myBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UploadPrescription extends StatefulWidget {
  @override
  _UploadPrescriptionState createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  bool toggleValue = false;
  final ImagePicker _picker = ImagePicker();
  List<XFile> images = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerPhoneController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  Future<void> _pickImage() async {
    try {
      final pickedImages = await _picker.pickMultiImage();

      if (pickedImages != null && pickedImages.isNotEmpty) {
        // Extract unique hash codes from the existing images
        final existingName = images.map((image) => image.name).toList();

        print(existingName);

        // Add new unique images based on hash codes from pickedImages
        final newImages = pickedImages.where((pickedImage) {
          print(pickedImage.hashCode);

          return !existingName.contains(pickedImage.name);
        }).toList();

        setState(() {
          // Combine existing images with new unique images
          images = [...images, ...newImages];
        });
      }
    } catch (e) {
      print("Image picker error: $e");
    }
  }

  Future<void> createOrder(BuildContext context) async {
    OrderProvider order = Provider.of<OrderProvider>(context, listen: false);
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    if (_formKey.currentState!.validate() && images.isNotEmpty) {
      Map<String, dynamic> data = {
        "user_id": auth.profile!.id,
        "remarks": remarksController.text ?? '',
        "image": images,
        "customer_name": customerNameController.text,
        "customer_phone": customerPhoneController.text,
        "delivery_address": customerAddressController.text,
      };

      final Map<String, dynamic> response = await order.placeOrder(data);

      if (response['status']) {
        Navigator.pushReplacementNamed(context, '/prepare-order',
            arguments: response['orderId']);
      } else {
        Flushbar(
          title: "Failed",
          message: response['message'].toString(),
          duration: const Duration(seconds: 3),
        ).show(context);
      }
    } else {
      Flushbar(
        title: 'Invalid Form',
        message: 'Please complete the form',
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }

  void toggle(bool value) {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    if (value) {
      customerNameController.text =
          '${auth.profile!.first_name} ${auth.profile!.last_name}';

      customerPhoneController.text = auth.profile!.contact_no;
      customerAddressController.text = auth.profile!.address;
    } else {
      customerNameController.text = '';
      customerPhoneController.text = '';
      customerAddressController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider order = Provider.of<OrderProvider>(context, listen: false);
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
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
                      images.isEmpty
                          ? Image.asset("assets/images/prescription.png")
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, // Adjust the number of columns as needed
                              ),
                              itemCount: images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    // Remove the image from the list when clicked
                                    setState(() {
                                      images.removeAt(index);
                                    });
                                  },
                                  child: Image.file(
                                    File(images[index].path),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),

                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                      //   child: Text(
                      //     "Upload your prescription",
                      //     style: TextStyle(
                      //         fontSize: 20, fontWeight: FontWeight.w600),
                      //   ),
                      // ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 160),
                          child: IconButton(
                            onPressed: () {
                              _pickImage();
                            },
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
                TextFormField(
                  controller: remarksController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Any Remark',
                    hintStyle: TextStyle(fontWeight: FontWeight.w300),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
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

                        toggle(value);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: customerNameController,
                        decoration: InputDecoration(
                          labelText: 'Customer Name',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the customer name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: customerPhoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Customer Phone',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          // Remove any non-numeric characters from the input
                          String cleanedValue =
                              value!.replaceAll(RegExp(r'[^0-9]'), '');

                          // Check if the cleanedValue is exactly 9 digits and starts with '7'
                          if (cleanedValue.length != 9 ||
                              !cleanedValue.startsWith('7')) {
                            return 'Please enter phone number as 7XXXXXXXX';
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: customerAddressController,
                        decoration: InputDecoration(
                          labelText: 'Delivery Address',
                          hintStyle: TextStyle(fontWeight: FontWeight.w300),
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
                        createOrder(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff2AB29D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      child: Consumer<OrderProvider>(
                        builder: (context, auth, child) {
                          return order.isLoading
                              ? CircularProgressIndicator()
                              : Text("PLACE THE ORDERS",
                                  style: TextStyle(fontSize: 18));
                        },
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomBar(),
    );
  }
}
