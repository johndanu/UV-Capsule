import 'package:another_flushbar/flushbar.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Screens/homeScreen.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int? selectedRadio;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedRadio = 1; // Initial selected radio button index
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  String? validateFirstName() {
    if (firstNameController.text.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  String? validateLastName() {
    if (lastNameController.text.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  String? validateAddress() {
    if (addressController.text.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  String? validateAge() {
    if (ageController.text.isEmpty) {
      return 'Please enter your age';
    }
    if (int.tryParse(ageController.text) == null) {
      return 'Please enter a valid age';
    }
    return null;
  }

  String? validateSriLankanPhoneNumber() {
    // Remove any non-numeric characters from the input
    String cleanedValue =
        contactNumberController.text.replaceAll(RegExp(r'[^0-9]'), '');

    // Check if the cleanedValue is exactly 9 digits and starts with '7'
    if (cleanedValue.length != 9 || !cleanedValue.startsWith('7')) {
      return 'Please enter phone number as 7XXXXXXXX';
    }

    return null;
  }

  Future<void> createProfile(BuildContext context) async {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);

    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        "mobile_no": auth.phone,
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "gender": selectedRadio == 1 ? 'male' : 'female',
        "age": int.tryParse(ageController.text),
        "address": addressController.text,
        "contact_no": contactNumberController.text
      };

      final Map<String, dynamic> response = await auth.createProfile(data);

      if (response['status']) {
        Navigator.pushReplacementNamed(context, '/home');
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
        message: 'Please enter valid otp number',
        duration: Duration(seconds: 5),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      controller: firstNameController,
                      decoration: InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      validator: (value) => validateFirstName(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                      border: Border.all(), // Add border
                    ),
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      validator: (value) => validateLastName(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                      border: Border.all(), // Add border
                    ),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        hintText: 'Address',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      validator: (value) => validateAddress(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Set border radius
                      border: Border.all(), // Add border
                    ),
                    child: TextFormField(
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        hintText: 'Age',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      validator: (value) => validateAge(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      controller: contactNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        hintText: 'Contact Number',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                      validator: (value) => validateSriLankanPhoneNumber(),
                      onFieldSubmitted: (value) {
                        // Trigger validation on field blur
                        _formKey.currentState!.validate();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setSelectedRadio(1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            border: Border.all(
                              color: selectedRadio == 1
                                  ? Color(0xff385592)
                                  : Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: IconButton(
                                  onPressed: () {
                                    setSelectedRadio(1);
                                  },
                                  icon: Icon(
                                    Icons.male_outlined,
                                    size: 40,
                                    color: selectedRadio == 1
                                        ? Color(0xff385592)
                                        : Colors.black26,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: selectedRadio == 1
                                      ? Color(0xff385592)
                                      : Colors.black26,
                                ),
                              )
                            ],
                          ),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setSelectedRadio(2);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            border: Border.all(
                              color: selectedRadio == 2
                                  ? Color(0xff385592)
                                  : Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: IconButton(
                                  onPressed: () {
                                    setSelectedRadio(2);
                                  },
                                  icon: Icon(
                                    Icons.female_outlined,
                                    size: 40,
                                    color: selectedRadio == 2
                                        ? Color(0xff385592)
                                        : Colors.black26,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: selectedRadio == 2
                                      ? Color(0xff385592)
                                      : Colors.black26,
                                ),
                              )
                            ],
                          ),
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff385592),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          createProfile(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff385592),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        child: Consumer<AuthProvider>(
                          builder: (context, auth, child) {
                            return auth.isLoading
                                ? CircularProgressIndicator()
                                : Text("CREATE PROFILE",
                                    style: TextStyle(fontSize: 18));
                          },
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
