import 'package:capsule/Screens/uploadPrescription.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greeting = '';
  final List<Map<String, dynamic>> imageData = [
    {
      'image': 'assets/images/img1.png',
      'text': 'Image 1',
    },
    {
      'image': 'assets/images/img2.png',
      'text': 'Image 2',
    },
    {
      'image': 'assets/images/img3.png',
      'text': 'Image 3',
    },
  ];

  @override
  void initState() {
    super.initState();
    final currentTime = DateTime.now();
    final timeOfDay = currentTime.hour;
    greeting = getGreeting(timeOfDay);
  }

  String getGreeting(int hour) {
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: RichText(
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
                    TextSpan(text: greeting),
                    TextSpan(
                      text: '\n\nCheck our services here. ',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Column(
              children: List.generate(imageData.length, (index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to another page when the container is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadPrescription(),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          width: double.infinity,
                          child: Image.asset(
                            imageData[index]['image'],
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          color: Color(0xff2AB29D),
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              imageData[index]['text'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
