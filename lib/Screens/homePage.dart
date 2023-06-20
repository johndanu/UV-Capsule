import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index

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
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final timeOfDay = currentTime.hour;

    String greeting = getGreeting(timeOfDay);

    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(imageData.length, (index) {
                    return Container(
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
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
}
