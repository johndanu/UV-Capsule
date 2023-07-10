import 'package:capsule/Screens/homeScreen.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({super.key});

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  int? selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0; // Initial selected radio button index
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
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
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
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
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
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
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      hintText: 'Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
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
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      hintText: 'Age',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
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
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontWeight: FontWeight.w300),
                      hintText: 'Contact Number',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
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
          border: Border.all(
            color: selectedRadio == 1 ? Color(0xff385592) : Colors.transparent,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          color: Color(0xffF5F6F8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: () {
                    setSelectedRadio(1);
                  },
                  icon: Icon(
                    Icons.male,
                    size: 40,
                    color: selectedRadio == 1 ? Color(0xff385592) : Colors.black26,
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
                  color: selectedRadio == 1 ? Color(0xff385592) : Colors.black26,
                ),
              )
            ],
          ),
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
            color: selectedRadio == 2 ? Color(0xff385592) : Colors.transparent,
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
                  color: selectedRadio == 2 ? Color(0xff385592) : Colors.black26,
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
                color: selectedRadio == 2 ? Color(0xff385592) : Colors.black26,
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff385592),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                    child: Text(
                      "CREATE PROFILE",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
