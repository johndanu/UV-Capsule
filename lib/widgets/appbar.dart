import 'package:capsule/Models/auth_model.dart';
import 'package:capsule/Providers/auth_provider.dart';
import 'package:capsule/Utils/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void logout(BuildContext context) async {
    await CapsulePreferences().clearAll();
    Navigator.pushReplacementNamed(context, '/main');
  }

  void _launchWhatsApp(BuildContext context) async {
    const whatsappNumber = "+94774288892"; // Replace with your WhatsApp number
    const message = "Hi, I need your assistance";
    var whatsappUrl =
        "whatsapp://send?phone=$whatsappNumber&text=${Uri.encodeFull(message)}";
    Uri uri = Uri.parse(whatsappUrl);
    print(uri);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("WhatsApp is not installed on the device"),
        ),
      );
    }
  }

  void _makePhoneCall(BuildContext context) async {
    const phoneNumber =
        'tel:+1234567890'; // Replace with your desired phone number
    Uri phoneNumber1 = Uri.parse(phoneNumber);

    if (await canLaunchUrl(phoneNumber1)) {
      await launchUrl(phoneNumber1);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Unable to launch phone app"),
        ),
      );
    }
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
              IconButton(
                icon: Icon(
                  Icons.message,
                  color: Colors.black38,
                ),
                onPressed: () {
                  _launchWhatsApp(context);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.call,
                  color: Colors.black38,
                ),
                onPressed: () {
                  _makePhoneCall(context);
                },
              ),
              if (loggedIn) // Conditional widget rendering
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
