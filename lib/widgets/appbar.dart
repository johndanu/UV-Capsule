import 'package:capsule/Screens/eChannelling.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset(
            'assets/images/loading.png',
            width: 30,
            height: 30,
          ),
          SizedBox(width: 8),
          Text(
            'CAPSULE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.help,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EChannelling()),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
