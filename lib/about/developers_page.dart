
import 'package:flutter/material.dart';

class DevelopersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Developer'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/b/inverted-autumn-view-crystal-ball-fallen-birch-tree-lies-reflection-forest-close-up-side-233379775.jpg?w=768",
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Developed by Romisah Osama',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Flutter Developer & Designer',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'About the Developer:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'I am a passionate Flutter developer with a focus on creating '
                  'beautiful and functional mobile applications. I have experience '
                  'in building responsive UIs, integrating APIs, and delivering high-quality code.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Skills & Expertise:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              '• Dart & Flutter\n'
                  '• Firebase Integration\n'
                  '• UI/UX Design\n'
                  '• RESTful APIs\n'
                  '• Responsive Layouts',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Contact Info:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Email: your.email@example.com\n'
                  'LinkedIn: linkedin.com/in/your-profile\n'
                  'GitHub: github.com/your-profile',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}