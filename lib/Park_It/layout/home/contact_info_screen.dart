import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  final String phoneNumber = 'tel:+1234567890';
  final String email = 'mailto:example@example.com';
  final String website = 'https://www.example.com';

  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactTile(
              icon: Icons.phone,
              text: 'Call Us',
              onTap: () => _launchURL(phoneNumber),
            ),
            ContactTile(
              icon: Icons.email,
              text: 'Email Us',
              onTap: () => _launchURL(email),
            ),
            ContactTile(
              icon: Icons.web,
              text: 'Visit Website',
              onTap: () => _launchURL(website),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const ContactTile({super.key, 
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
