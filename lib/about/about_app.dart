import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About This App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'This app provides users with a seamless experience for browsing products, chatting with others, and managing their personal profiles. With features like messenger, product browsing, and user profile management, the app is designed to be user-friendly and efficient.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Features:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Product browsing by category\n'
                  '• User profiles\n'
                  '• Messenger for easy communication\n'
                  '• Smooth and intuitive user interface',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'We hope you enjoy using the app!',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}