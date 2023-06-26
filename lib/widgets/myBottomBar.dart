import 'package:flutter/material.dart';

import '../Screens/homePage.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             IconButton(
               icon: Icon(
                 Icons.home,
                 color: Colors.black38,
               ),
               onPressed: () {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                     builder: (context) => HomeScreen(selectedIndex: 0),
                   ),
                 );
               },
             ),
             Text('Home'),
           ],
         ),
         Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             IconButton(
               icon: Icon(
                 Icons.shopping_bag,
                 color: Colors.black38,
               ),
               onPressed: () {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                     builder: (context) => HomeScreen(selectedIndex: 1),
                   ),
                 );
               },
             ),
             Text('My Orders'),
           ],
         ),
         Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             IconButton(
               icon: Icon(
                 Icons.person,
                 color: Colors.black38,
               ),
               onPressed: () {
                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                     builder: (context) => HomeScreen(selectedIndex: 2),
                   ),
                 );
               },
             ),
             Text('Profile'),
           ],
         ),
       ],
     ),
      );
  }
}
