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
    return Container(
      // height: 70, // Adjust the height as desired
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildBottomBarButton(Icons.home, 'Home', 0),
            buildBottomBarButton(Icons.shopping_bag, 'My Orders', 1),
            buildBottomBarButton(Icons.person, 'Profile', 2),
          ],
        ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: buttonColor,
            ),
            SizedBox(
              height: 2,
            ),
            Text(text),
          ],
        ),
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
