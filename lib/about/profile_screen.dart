
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://img.freepik.com/free-photo/view-spectacular-nature-landscape_23-2150763636.jpg?t=st=1726271425~exp=1726275025~hmac=2c5d62b6ee0eea9de6e546af644188179779a7683fb029a134716fe6c3ca6b11&w=1380", // Replace with your background image URL
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 16,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          "https://thumbs.dreamstime.com/b/inverted-autumn-view-crystal-ball-fallen-birch-tree-lies-reflection-forest-close-up-side-233379775.jpg?w=768",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            Text(
              'Romisah Osama',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Active status',
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.edit,color: Colors.black,),
              title: Text('Edit Profile'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline,color: Colors.black,),
              title: Text('About'),
              onTap: () {

              },
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Colors.black,),
              title: Text('Logout'),
              onTap: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}