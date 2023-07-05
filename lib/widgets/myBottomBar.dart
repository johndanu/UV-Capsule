import 'package:flutter/material.dart';
import '../Screens/homeScreen.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({
    Key? key,
  }) : super(key: key);

  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildBottomBarButton(Icons.home, 'Home', 0),
          buildBottomBarButton(Icons.shopping_bag, 'My Orders', 1),
          buildBottomBarButton(Icons.person, 'Profile', 2),
        ],
      ),
    );
  }

  Widget buildBottomBarButton(IconData icon, String text, int index) {
    Color buttonColor = selectedIndex == index ? Colors.grey : Colors.black38;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        navigateToScreen(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              icon,
              color: buttonColor,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = index;
              });

              navigateToScreen(index);
            },
          ),
          Text(text),
        ],
      ),
    );
  }

  void navigateToScreen(int index) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(selectedIndex: index),
      ),
    );
  }
}
