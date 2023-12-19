import 'package:capsule/Models/auth_model.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void logout(BuildContext context) async {
    await CapsulePreferences().clearAll();
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    return FutureBuilder<Login>(
      future: CapsulePreferences().getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
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
          );
        } else {
          // Loaded state
          bool loggedIn = snapshot.data?.userId != null;

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
              // IconButton(
              //   icon: Icon(
              //     Icons.help,
              //     color: Colors.black38,
              //   ),
              //   onPressed: () {},
              // ),
              if (loggedIn)
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.black38,
                  ),
                  onPressed: () {
                    logout(context);
                  },
                ),
            ],
          );
        }
      },
    );
  }
}
