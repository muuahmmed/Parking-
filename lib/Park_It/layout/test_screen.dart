import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Support contact'),
              onTap: () {
                _launchSupportContact(context);
              },
            ),
            ListTile(
              title: const Text('Share'),
              onTap: () {
                _shareApp(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void _launchSupportContact(BuildContext context) async {
    const phoneNumber = '+1234567890'; // Replace with your customer service phone number
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch phone')),
      );
    }
  }

  void _shareApp(BuildContext context) {
    const String text = 'Check out this cool app!'; // Your share message
    const String url = 'https://yourappurl.com'; // URL to your app on the Play Store or App Store

    Share.share('$text $url');
  }
}


